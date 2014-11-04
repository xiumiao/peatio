require 'spec_helper'

describe APIv2::Mobile do

  let(:member) { create(:member) }
  let(:token)  { create(:mobile_provider_token, member: member) }

  describe "POST /api/v2/mobile/verification_codes" do
    it "should send sms verification code" do
    end

    it "should return uid on success" do
    end

    it "should get uid not found error" do
    end

    it "should get two factor disabled error" do
    end
  end

end
