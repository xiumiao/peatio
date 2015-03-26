require 'spec_helper'

describe IdentitiesController do

  describe "PUT #update" do
    let(:member) { create(:member, :sms_two_factor_activated) }

    before do
      email_identity = create(:identity, login: 'update-pass@example.com')
      create(:authentication, member: member, uid: email_identity.id)
      phone_identity = create(:identity, login: '18888888888', login_type: 'phone_number')
      create(:authentication, member: member, uid: phone_identity.id)

      session[:member_id] = member.id
    end

    it "should update all passwords" do
      newpass = 'Foo123@BAR'
      put :update, identity: {old_password: 'Password123', password: newpass, password_confirmation: newpass}
      response.should be_redirect
      member.identities.each do |i|
        i.authenticate(newpass).should == i
      end
    end
  end

end
