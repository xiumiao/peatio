require "spec_helper"

describe IpoApplicantsController do
  describe "routing" do

    it "routes to #index" do
      get("/ipo_applicants").should route_to("ipo_applicants#index")
    end

    it "routes to #new" do
      get("/ipo_applicants/new").should route_to("ipo_applicants#new")
    end

    it "routes to #show" do
      get("/ipo_applicants/1").should route_to("ipo_applicants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ipo_applicants/1/edit").should route_to("ipo_applicants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ipo_applicants").should route_to("ipo_applicants#create")
    end

    it "routes to #update" do
      put("/ipo_applicants/1").should route_to("ipo_applicants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ipo_applicants/1").should route_to("ipo_applicants#destroy", :id => "1")
    end

  end
end
