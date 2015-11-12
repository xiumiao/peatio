require 'spec_helper'

describe "ipo_applicants/edit" do
  before(:each) do
    @ipo_applicant = assign(:ipo_applicant, stub_model(IpoApplicant,
      :production => "MyString",
      :base_unit => "MyString",
      :issue_price => "9.99",
      :total_stock => 1,
      :ipo_count => 1,
      :top_limit => 1,
      :state => 1,
      :member_id => 1,
      :audit_id => 1
    ))
  end

  it "renders the edit ipo_applicant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ipo_applicant_path(@ipo_applicant), "post" do
      assert_select "input#ipo_applicant_production[name=?]", "ipo_applicant[production]"
      assert_select "input#ipo_applicant_base_unit[name=?]", "ipo_applicant[base_unit]"
      assert_select "input#ipo_applicant_issue_price[name=?]", "ipo_applicant[issue_price]"
      assert_select "input#ipo_applicant_total_stock[name=?]", "ipo_applicant[total_stock]"
      assert_select "input#ipo_applicant_ipo_count[name=?]", "ipo_applicant[ipo_count]"
      assert_select "input#ipo_applicant_top_limit[name=?]", "ipo_applicant[top_limit]"
      assert_select "input#ipo_applicant_state[name=?]", "ipo_applicant[state]"
      assert_select "input#ipo_applicant_member_id[name=?]", "ipo_applicant[member_id]"
      assert_select "input#ipo_applicant_audit_id[name=?]", "ipo_applicant[audit_id]"
    end
  end
end
