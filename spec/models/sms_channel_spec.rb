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
    context "read from sms_two_factor source" do
      specify do
        channel.notify!({deposit_id: deposit.id})
        expect(channel.number).to eq(member.sms_two_factor.source)
      end
    end

    context "read from member phone_number" do
      before { member.update_attributes(phone_number: "119", phone_number_activated: true) }
       specify do
        channel.notify!({deposit_id: deposit.id})
        expect(channel.number).to eq(member.phone_number)
      end
    end
  end

  context "notify!" do
    it "should send the sms" do
      AMQPQueue.expects(:enqueue).with(:sms_notification, {phone: member.sms_two_factor.source, message: content})
      channel.notify!({deposit_id: deposit.id})
    end
  end

end
