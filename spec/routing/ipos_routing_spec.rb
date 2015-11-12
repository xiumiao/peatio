require "spec_helper"

describe IposController do
  describe "routing" do

    it "routes to #index" do
      get("/ipos").should route_to("ipos#index")
    end

    it "routes to #new" do
      get("/ipos/new").should route_to("ipos#new")
    end

    it "routes to #show" do
      get("/ipos/1").should route_to("ipos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ipos/1/edit").should route_to("ipos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ipos").should route_to("ipos#create")
    end

    it "routes to #update" do
      put("/ipos/1").should route_to("ipos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ipos/1").should route_to("ipos#destroy", :id => "1")
    end

  end
end
