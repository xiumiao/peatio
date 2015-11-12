require 'spec_helper'

describe "ipo_applicants/index" do
  before(:each) do
    assign(:ipo_applicants, [
      stub_model(IpoApplicant,
        :production => "Production",
        :base_unit => "Base Unit",
        :issue_price => "9.99",
        :total_stock => 1,
        :ipo_count => 2,
        :top_limit => 3,
        :state => 4,
        :member_id => 5,
        :audit_id => 6
      ),
      stub_model(IpoApplicant,
        :production => "Production",
        :base_unit => "Base Unit",
        :issue_price => "9.99",
        :total_stock => 1,
        :ipo_count => 2,
        :top_limit => 3,
        :state => 4,
        :member_id => 5,
        :audit_id => 6
      )
    ])
  end

  it "renders a list of ipo_applicants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Production".to_s, :count => 2
    assert_select "tr>td", :text => "Base Unit".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
