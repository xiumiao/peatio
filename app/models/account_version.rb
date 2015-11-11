class AccountVersion < ActiveRecord::Base
  include Currencible

  HISTORY = [Account::STRIKE_ADD, Account::STRIKE_SUB, Account::STRIKE_FEE, Account::DEPOSIT, Account::WITHDRAW, Account::FIX]

  enumerize :fun, in: Account::FUNS

  # 交易变动类型
  REASON_CODES = {
    Account::UNKNOWN => 0, # 未知
    Account::FIX => 1, # 确认
    Account::STRIKE_FEE => 100, # 交易费
    Account::STRIKE_ADD => 110, # 增加(人民币或BTC)
    Account::STRIKE_SUB => 120, # 减少(人民币或BTC)
    Account::STRIKE_UNLOCK => 130, # 锁定
    Account::ORDER_SUBMIT => 600, # 订单提交（买入BTC，扣除账户对应的人民币)？
    Account::ORDER_CANCEL => 610, # 订单撤销
    Account::ORDER_FULLFILLED => 620, # 充值记录
    Account::WITHDRAW_LOCK => 800, # 提现锁定
    Account::WITHDRAW_UNLOCK => 810, # 提现解锁
    Account::DEPOSIT => 1000, # 入金（充值）
    Account::WITHDRAW => 2000 } # 出金（提现）
  enumerize :reason, in: REASON_CODES, scope: true

  belongs_to :account
  belongs_to :modifiable, polymorphic: true

  scope :history, -> { with_reason(*HISTORY).reverse_order }

  # Use account balance and locked columes as optimistic lock column. If the
  # passed in balance and locked doesn't match associated account's data in
  # database, exception raise. Otherwise the AccountVersion record will be
  # created.
  #
  # TODO: find a more generic way to construct the sql
  def self.optimistically_lock_account_and_create!(balance, locked, attrs)
    attrs = attrs.symbolize_keys

    attrs[:created_at] = Time.now
    attrs[:updated_at] = attrs[:created_at]
    attrs[:fun]        = Account::FUNS[attrs[:fun]]
    attrs[:reason]     = REASON_CODES[attrs[:reason]]
    attrs[:currency]   = Currency.enumerize[attrs[:currency]]

    account_id = attrs[:account_id]
    raise ActiveRecord::ActiveRecordError, "account must be specified" unless account_id.present?

    qmarks       = (['?']*attrs.size).join(',')
    values_array = [qmarks, *attrs.values]
    values       = ActiveRecord::Base.send :sanitize_sql_array, values_array

    select = Account.unscoped.select(values).where(id: account_id, balance: balance, locked: locked).to_sql
    stmt   = "INSERT INTO account_versions (#{attrs.keys.join(',')}) #{select}"

    # 添加手续费转账功能()
    if attrs[:reason] == Account::STRIKE_SUB \
                and attrs[:fee] > 0 \
                  and attrs[:currency] == Currency.enumerize[:cny]
      # if 该交易账户是 会员单位
      #    不做处理，还是返回手续费
      # elsif 该交易账户是 交易商
      #  查找该账户的会员单位，按分成比例给该会员账户账上添加手续费
      # else
      # end
      if account.member.employer?


      else
        fee  = attrs[:fee]
        company = account.member.id_document.employer.member
        cny_account  = company.cny # 目前只扣除人民币账户
        fee_rate  = company.fee # 取出该会员单位约定手续费分成比例
        company_fee = fee_rate.factor_bid*fee
        platform_fee  = fee - company_fee
        cny_account.change_balance_and_locked(company_fee, Account::ZERO)

      end
    end
    connection.insert(stmt).tap do |id|
      if id == 0
        record = new attrs
        raise ActiveRecord::StaleObjectError.new(record, "create")
      end
    end
  end

  def detail_template
    if self.detail.nil? || self.detail.empty?
      return ["system", {}]
    end

    [self.detail.delete(:tmp) || "default", self.detail || {}]
  end

  def amount_change
    balance + locked
  end

  def in
    amount_change > 0 ? amount_change : nil
  end

   def out
    amount_change < 0 ? amount_change : nil
  end

  alias :template :detail_template
end
