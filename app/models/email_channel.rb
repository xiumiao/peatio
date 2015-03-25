class EmailChannel < NotificationChannel
  attr_reader :mailer, :args

  def notify!(payload = {})
    @payload = payload
    setup_mailer_and_args
    @mailer.send(name, *args).deliver if notifyable?
  end

  def notifyable?
    member.email_activated
  end

  private

  def setup_mailer_and_args
    if %w[deposit_accepted].include?(name)
      @mailer = DepositMailer
      @args = [payload[:deposit_id]]
    elsif %w[withdraw_submitted withdraw_processing withdraw_done withdraw_state].include?(name)
      @mailer = WithdrawMailer
      @args = [payload[:withdraw_id]]
    else
      @mailer = MemberMailer
      @args = [member.id]
    end
  end
end
