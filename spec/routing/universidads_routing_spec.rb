require "spec_helper"

describe UniversidadsController do
  describe "routing" do

    it "routes to #index" do
      get("/universidads").should route_to("universidads#index")
    end

    it "routes to #new" do
      get("/universidads/new").should route_to("universidads#new")
    end

    it "routes to #show" do
      get("/universidads/1").should route_to("universidads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/universidads/1/edit").should route_to("universidads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universidads").should route_to("universidads#create")
    end

    it "routes to #update" do
      put("/universidads/1").should route_to("universidads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/universidads/1").should route_to("universidads#destroy", :id => "1")
    end

  end
end
