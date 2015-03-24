namespace :identity do
  desc "Add the login_type"
  task reset_login_type: :environment do
    Identity.find_each do |i|
      if i.login =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        i.update_attribute :login_type, 'email'
      elsif i.login =~ /^\d+$/
        i.update_attribute :login_type, 'phone_number'
      end
    end
  end

  desc "Move the phone number from member to two factor."
  task move_phone_number_to_two_factor: :environment do
    Member.find_each do |m|
      if m.phone_number && m.sms_two_factor.activated?
        ActiveRecord::Base.transaction do
          pn =  m.phone_number
          m.update_attributes(phone_number: nil, phone_number_activated: nil)
          m.sms_two_factor.update_attribute(:source, pn)
        end
      end
    end
  end
end
