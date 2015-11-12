require 'spec_helper'

describe "ipo_numbers/new" do
  before(:each) do
    assign(:ipo_number, stub_model(IpoNumber,
      :ipo_id => 1
    ).as_new_record)
  end

  it "renders new ipo_number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ipo_numbers_path, "post" do
      assert_select "input#ipo_number_ipo_id[name=?]", "ipo_number[ipo_id]"
    end
  end
end
