class SmsChannel < NotificationChannel
  SUPORT_NOTIFY_TYPE = %w[withdraw_done deposit_accepted]

  def notify!(payload = {})
    @payload = payload
    if SUPORT_NOTIFY_TYPE.include?(name) && notifyable?
      AMQPQueue.enqueue(:sms_notification, phone: number, message: content)
    end
  end

  def notifyable?
    member.phone_number_activated || member.sms_two_factor.activated?
  end

  def number
    if member.phone_number_activated
      member.phone_number
    elsif member.sms_two_factor.activated?
      member.sms_two_factor.source
    end
  end

  def content
    case name
    when "withdraw_done"
      withdraw = Withdraw.find(payload[:withdraw_id])
      I18n.t('sms.withdraw_done', email: member.email || member.phone_number,
             currency: withdraw.currency_text,
             time: I18n.l(Time.now),
             amount: withdraw.amount,
             balance: withdraw.account.balance)
    when "deposit_accepted"
      deposit = Deposit.find(payload[:deposit_id])
      I18n.t('sms.deposit_done', email: member.email || member.phone_number,
             currency: deposit.currency_text,
             time: I18n.l(Time.now),
             amount: deposit.amount,
             balance: deposit.account.balance)
    end
  end

end
