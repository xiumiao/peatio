module APIv2
  class Mobile < Grape::API

    before { authenticate_mobile_provider! }

    desc 'Request mobile verification code.'
    params do
      requires :uid_type, type: Symbol, desc: "UID type", values: [:email, :phone_number]
      requires :uid_value, type: String, desc: "UID value"
    end
    post "/mobile/verification_codes" do
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
