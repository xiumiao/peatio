require 'spec_helper'

describe "ipos/new" do
  before(:each) do
    assign(:ipo, stub_model(Ipo,
      :pre_ipo_id => 1,
      :member_id => 1,
      :amount => 1,
      :count => 1,
      :state => 1
    ).as_new_record)
  end

  it "renders new ipo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ipos_path, "post" do
      assert_select "input#ipo_pre_ipo_id[name=?]", "ipo[pre_ipo_id]"
      assert_select "input#ipo_member_id[name=?]", "ipo[member_id]"
      assert_select "input#ipo_amount[name=?]", "ipo[amount]"
      assert_select "input#ipo_count[name=?]", "ipo[count]"
      assert_select "input#ipo_state[name=?]", "ipo[state]"
    end
  end
end
