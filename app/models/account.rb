class Account < ActiveRecord::Base
  include Currencible

  FIX = :fix
  UNKNOWN = :unknown
  STRIKE_ADD = :strike_add
  STRIKE_SUB = :strike_sub
  STRIKE_FEE = :strike_fee
  STRIKE_UNLOCK = :strike_unlock
  ORDER_CANCEL = :order_cancel
  ORDER_SUBMIT = :order_submit
  ORDER_FULLFILLED = :order_fullfilled
  WITHDRAW_LOCK = :withdraw_lock
  WITHDRAW_UNLOCK = :withdraw_unlock
  DEPOSIT = :deposit
  WITHDRAW = :withdraw
  ZERO = 0.to_d

  FUNS = {:unlock_funds => 1, :lock_funds => 2,
          :plus_funds => 3, :sub_funds => 4,
          :unlock_and_sub_funds => 5,
          :plus_fee_funds=>6 } # 增加一中手续费

  belongs_to :member
  has_many :payment_addresses
  has_many :versions, class_name: "::AccountVersion"
  has_many :partial_trees

  # Suppose to use has_one here, but I want to store
  # relationship at account side. (Daniel)
  belongs_to :default_withdraw_fund_source, class_name: 'FundSource'

  validates :member_id, uniqueness: { scope: :currency }
  validates_numericality_of :balance, :locked, greater_than_or_equal_to: ZERO

  scope :enabled, -> { where("currency in (?)", Currency.ids) }

  after_commit :trigger, :sync_update

  def payment_address
    payment_addresses.last || payment_addresses.create(currency: self.currency)
  end

  def self.after(*names)
    names.each do |name|
      m = instance_method(name.to_s)
      define_method(name.to_s) do |*args, &block|
        m.bind(self).(*args, &block)
        yield(self, name.to_sym, *args)
        self
      end
    end
  end

  def plus_funds(amount, fee: ZERO, reason: nil, ref: nil)
    (amount <= ZERO or fee > amount) and raise AccountError, "cannot add funds (amount: #{amount})"
    change_balance_and_locked amount, 0
  end

  #  增加一条手续费（估计暂时用不到）
  def plus_fee_funds(amount, fee: ZERO, reason: nil, ref: nil)
    (amount <= ZERO or fee > amount) and raise AccountError, "cannot add funds (amount: #{amount})"
    change_balance_and_locked amount, 0
  end

  def sub_funds(amount, fee: ZERO, reason: nil, ref: nil)
    (amount <= ZERO or amount > self.balance) and raise AccountError, "cannot subtract funds (amount: #{amount})"
    change_balance_and_locked -amount, 0
  end

  def lock_funds(amount, reason: nil, ref: nil)
    (amount <= ZERO or amount > self.balance) and raise AccountError, "cannot lock funds (amount: #{amount})"
    change_balance_and_locked -amount, amount
  end

  def unlock_funds(amount, reason: nil, ref: nil)
    (amount <= ZERO or amount > self.locked) and raise AccountError, "cannot unlock funds (amount: #{amount})"
    change_balance_and_locked amount, -amount
  end

  def unlock_and_sub_funds(amount, locked: ZERO, fee: ZERO, reason: nil, ref: nil)
    raise AccountError, "cannot unlock and subtract funds (amount: #{amount})" if ((amount <= 0) or (amount > locked))
    raise LockedError, "invalid lock amount" unless locked
    raise LockedError, "invalid lock amount (amount: #{amount}, locked: #{locked}, self.locked: #{self.locked})" if ((locked <= 0) or (locked > self.locked))
    change_balance_and_locked locked-amount, -locked
  end

  after(*FUNS.keys) do |account, fun, changed, opts|
    begin
      opts ||= {}
      fee = opts[:fee] || ZERO
      reason = opts[:reason] || Account::UNKNOWN
      attributes = { fun: fun,
                     fee: fee,
                     reason: reason,
                     amount: account.amount,
                     currency: account.currency.to_sym,
                     member_id: account.member_id,
                     account_id: account.id }

      if opts[:ref] and opts[:ref].respond_to?(:id)
        ref_klass = opts[:ref].class
        attributes.merge! \
          modifiable_id: opts[:ref].id,
          modifiable_type: ref_klass.respond_to?(:base_class) ? ref_klass.base_class.name : ref_klass.name
      end

      locked, balance = compute_locked_and_balance(fun, changed, opts)
      attributes.merge! locked: locked, balance: balance

      AccountVersion.optimistically_lock_account_and_create!(account.balance, account.locked, attributes)


      # 添加手续费转账功能(转到交易商对应的会员单位账户下)
      # 以下条件为： 账户增加 人民币 并且收费大于0
      if AccountVersion::REASON_CODES[attributes[:reason]] == AccountVersion::REASON_CODES[Account::STRIKE_ADD] \
                and attributes[:fee] > 0 \
                  and attributes[:currency] == :cny


        if account.member.employer? # 如果是会员单位交易的话
          company = account.member.id_document.member
        else
          company = account.member.id_document.employer.member
        end
        fee  = attributes[:fee]
        cny_account  = company.cny # 目前只扣除人民币账户
        fee_rate  = company.fee # 取出该会员单位约定手续费分成比例
        company_fee = fee_rate.factor_bid*fee
        platform_fee  = fee - company_fee
        # 手续费转到会员单位，需在会员单位的账户上添加金额
        # 然后在账户资金变动明细表(account_versions)上增加一个费用变动
        cny_account.change_balance_and_locked(company_fee, Account::ZERO)
        # 在这里发邮件不好吧？ 如果交易回滚，但是邮件已经发出就糟糕了

        # 在账户变动表中增加一条，收费变更
        company_attributes = {
            :fun=>:plus_fee_funds, # 固定类型
            :fee=> - company_fee, # 扣除平台手续费
            :reason=>:strike_fee, # 类型
            :amount=>account.amount, # 账户总额
            :currency=>:cny, # 币种只能为人民币
            :member_id=>company.id, # 会员单位
            :account_id=>cny_account.id, # 人民币账户
            :modifiable_id=>attributes[:modifiable_id], #  无需改动
            :modifiable_type=>attributes[:modifiable_type], # 固定类型
            :locked=>0.to_d,
            :balance=> company_fee # 余额变动
        }
        binding.pry_remote
        AccountVersion.optimistically_lock_account_and_create!(cny_account.balance, cny_account.locked, company_attributes)
      end
    rescue ActiveRecord::StaleObjectError
      Rails.logger.info "Stale account##{account.id} found when create associated account version, retry."
      account = Account.find(account.id)
      raise ActiveRecord::RecordInvalid, account unless account.valid?
      retry
    end
  end

  def self.compute_locked_and_balance(fun, amount, opts)
    raise AccountError, "invalid account operation" unless FUNS.keys.include?(fun)

    case fun
    when :sub_funds then [ZERO, ZERO - amount]
    when :plus_funds then [ZERO, amount]
    when :lock_funds then [amount, ZERO - amount]
    when :unlock_funds then [ZERO - amount, amount]
    when :unlock_and_sub_funds
      locked = ZERO - opts[:locked]
      balance = opts[:locked] - amount
      [locked, balance]
    else raise AccountError, "forbidden account operation"
    end
  end

  def amount
    self.balance + self.locked
  end

  def last_version
    versions.last
  end

  def examine
    expected = 0
    versions.find_each(batch_size: 100000) do |v|
      expected += v.amount_change
      return false if expected != v.amount
    end

    expected == self.amount
  end

  def trigger
    return unless member

    json = Jbuilder.encode do |json|
      json.(self, :balance, :locked, :currency)
    end
    member.trigger('account', json)
  end

  def change_balance_and_locked(delta_b, delta_l)
    self.balance += delta_b
    self.locked  += delta_l
    self.class.connection.execute "update accounts set balance = balance + #{delta_b}, locked = locked + #{delta_l} where id = #{id}"
    add_to_transaction # so after_commit will be triggered
    self
  end

  scope :locked_sum, -> (currency) { with_currency(currency).sum(:locked) }
  scope :balance_sum, -> (currency) { with_currency(currency).sum(:balance) }

  class AccountError < RuntimeError; end
  class LockedError < AccountError; end
  class BalanceError < AccountError; end

  def as_json(options = {})
    super(options).merge({
      # check if there is a useable address, but don't touch it to create the address now.
      "deposit_address" => payment_addresses.empty? ? "" : payment_address.deposit_address,
      "name_text" => currency_obj.name_text,
      "default_withdraw_fund_source_id" => default_withdraw_fund_source_id
    })
  end

  private

  def sync_update
    ::Pusher["private-#{member.sn}"].trigger_async('accounts', { type: 'update', id: self.id, attributes: {balance: balance, locked: locked} })
  end

end
