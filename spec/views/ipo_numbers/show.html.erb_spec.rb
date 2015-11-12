require 'spec_helper'

describe "ipo_numbers/show" do
  before(:each) do
    @ipo_number = assign(:ipo_number, stub_model(IpoNumber,
      :ipo_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
