require 'spec_helper'

describe "ipo_numbers/edit" do
  before(:each) do
    @ipo_number = assign(:ipo_number, stub_model(IpoNumber,
      :ipo_id => 1
    ))
  end

  it "renders the edit ipo_number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ipo_number_path(@ipo_number), "post" do
      assert_select "input#ipo_number_ipo_id[name=?]", "ipo_number[ipo_id]"
    end
  end
end
