require "spec_helper"

describe IpoNumbersController do
  describe "routing" do

    it "routes to #index" do
      get("/ipo_numbers").should route_to("ipo_numbers#index")
    end

    it "routes to #new" do
      get("/ipo_numbers/new").should route_to("ipo_numbers#new")
    end

    it "routes to #show" do
      get("/ipo_numbers/1").should route_to("ipo_numbers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ipo_numbers/1/edit").should route_to("ipo_numbers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ipo_numbers").should route_to("ipo_numbers#create")
    end

    it "routes to #update" do
      put("/ipo_numbers/1").should route_to("ipo_numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ipo_numbers/1").should route_to("ipo_numbers#destroy", :id => "1")
    end

  end
end
