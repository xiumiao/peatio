require 'spec_helper'

describe "IpoApplicants" do
  describe "GET /ipo_applicants" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get ipo_applicants_path
      response.status.should be(200)
    end
  end
end