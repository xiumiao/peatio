class IpoApplicant < ActiveRecord::Base
  belongs_to :member
  belongs_to :auditor , class_name:'Member', foreign_key: :audit_id
  has_many :ipos
  has_many :ipo_numbers, through: :ipos

  extend Enumerize

  include AASM
  include AASM::Locking

  STATES = [:submitting, :cancelled, :submitted, :rejected, :accepted, :checked, :warning]

  enumerize :state, in: STATES, scope: true

  aasm :column =>'state', :whiny_transitions => false do
    state :submitting, initial: true #, before_enter: :set_fee
    state :cancelled
    state :submitted
    state :rejected
    state :accepted, before_commit: :send_email
    state :checked
    state :warning

    event :submit do
      transitions from: :submitting, to: :submitted
    end

    event :cancel do
      transitions from: :submitting, to: :cancelled
    end

    event :reject do
      transitions from: :submitted, to: :rejected,:on_transition => Proc.new {|obj, *args| obj.update_auditor(*args) }
    end

    event :accept do
      transitions from: :submitted, to: :accepted, :on_transition => Proc.new {|obj, *args| obj.update_auditor(*args) }
    end

    event :check do
      transitions from: :accepted, to: :checked
    end

    event :warn do
      transitions from: :accepted, to: :warning
    end
  end

  scope :need_audit, ->{ where state:[ :submitted,:accepted]}
  scope :owner, ->(current_user) { where member_id: current_user.id}
  scope :approved, ->{ where(['state="accepted" and start_time <= ? and end_time >= ?', Time.now, Time.now])}

  def approved?
    self.class.approved.include? self
  end

  def has_subscribe? member
    ipos.map(&:member).include? member
  end

  def update_auditor(current_user,*args)
    update({audit_id: current_user.id,audit_time:Time.now})
  end

  # 总共募集资金
  def collect_amount
    total_stock*issue_price
  end

  def send_email
    # case state
    #   when 'submitted'
    #     WithdrawMailer.submitted(self.id).deliver
    #   when 'processing'
    #     WithdrawMailer.processing(self.id).deliver
    #   when 'done'
    #     WithdrawMailer.done(self.id).deliver
    #   else
    #     WithdrawMailer.withdraw_state(self.id).deliver
    # end
  end
end
