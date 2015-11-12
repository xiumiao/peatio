require 'spec_helper'

describe "ipos/index" do
  before(:each) do
    assign(:ipos, [
      stub_model(Ipo,
        :pre_ipo_id => 1,
        :member_id => 2,
        :amount => 3,
        :count => 4,
        :state => 5
      ),
      stub_model(Ipo,
        :pre_ipo_id => 1,
        :member_id => 2,
        :amount => 3,
        :count => 4,
        :state => 5
      )
    ])
  end

  it "renders a list of ipos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
