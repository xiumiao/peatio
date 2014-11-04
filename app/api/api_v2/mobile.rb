module APIv2
  class Mobile < Grape::API

    before { authenticate_mobile_provider! }

    desc 'Request mobile verification code.'
    params do
      requires :uid_type, type: Symbol, desc: "UID type", values: [:email, :phone_number]
      requires :uid_value, type: String, desc: "UID value"
    end
    post "/mobile/verification_codes" do
      user = find_member_by_uid(params[:uid_type], params[:uid_value])
      raise UIDNotFoundError, params[:uid_type], params[:uid_value] unless user

      two_factor = user.two_factors.by_type('sms')
      raise TwoFactorDisabledError, 'sms' unless two_factor.activated?

      two_factor.refresh!
      two_factor.send_otp!

      {uid_type: params[:uid_type], uid_value: params[:uid_value]}
    end

    desc 'Request user access token using verification code.'
    params do
      requires :uid_type, type: Symbol, desc: "UID type", values: [:email, :phone_number]
      requires :uid_value, type: String, desc: "UID value"
      requires :code, type: String, desc: "Verification code"
    end
    post "/mobile/access_tokens" do
    end

  end
end
