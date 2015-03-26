require 'spec_helper'

describe SmsChannel do
  let!(:member) { create(:member, :sms_two_factor_activated, email: "xman@xman.xman") }
  let!(:deposit) { create(:deposit, member: member) }
  let!(:channel) { member.sms_channels.create(notify_type: 'deposit_accepted') }
  let(:content) { "Hi xman@xman.xman, the request of your deposit is complete." }


  describe "#context" do
    it "should display the notification content" do
      channel.notify!({deposit_id: deposit.id})
      expect(channel.content).to eq(content)
    end
  end

  describe "#number" do
    context "read from sms_two_factor uid" do
      specify do
        channel.notify!({deposit_id: deposit.id})
        expect(channel.number).to eq(member.sms_two_factor.uid)
      end
    end
  end

  context "notify!" do
    it "should send the sms" do
      AMQPQueue.expects(:enqueue).with(:sms_notification, {phone: member.sms_two_factor.uid, message: content})
      channel.notify!({deposit_id: deposit.id})
    end
  end

end
