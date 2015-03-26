# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
    provider "identity"
    uid "MyString"
    token "MyString"
    secret "MyString"
    member { activated_member }
  end
end
