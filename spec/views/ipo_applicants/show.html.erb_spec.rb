require 'spec_helper'

describe "ipo_applicants/show" do
  before(:each) do
    @ipo_applicant = assign(:ipo_applicant, stub_model(IpoApplicant,
      :production => "Production",
      :base_unit => "Base Unit",
      :issue_price => "9.99",
      :total_stock => 1,
      :ipo_count => 2,
      :top_limit => 3,
      :state => 4,
      :member_id => 5,
      :audit_id => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Production/)
    rendered.should match(/Base Unit/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
  end
end
