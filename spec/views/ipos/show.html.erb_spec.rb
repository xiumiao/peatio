require 'spec_helper'

describe "ipos/show" do
  before(:each) do
    @ipo = assign(:ipo, stub_model(Ipo,
      :pre_ipo_id => 1,
      :member_id => 2,
      :amount => 3,
      :count => 4,
      :state => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
