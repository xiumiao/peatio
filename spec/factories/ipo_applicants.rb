# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ipo_applicant do
    production "MyString"
    base_unit "MyString"
    issue_price "9.99"
    total_stock 1
    ipo_count 1
    top_limit 1
    start_time "2015-11-12 17:13:54"
    end_time "2015-11-12 17:13:54"
    state 1
    member_id 1
    audit_id 1
    audit_time "2015-11-12 17:13:54"
  end
end
