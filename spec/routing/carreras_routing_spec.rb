require "spec_helper"

describe CarrerasController do
  describe "routing" do

    it "routes to #index" do
      get("/carreras").should route_to("carreras#index")
    end

    it "routes to #new" do
      get("/carreras/new").should route_to("carreras#new")
    end

    it "routes to #show" do
      get("/carreras/1").should route_to("carreras#show", :id => "1")
    end

    it "routes to #edit" do
      get("/carreras/1/edit").should route_to("carreras#edit", :id => "1")
    end

    it "routes to #create" do
      post("/carreras").should route_to("carreras#create")
    end

    it "routes to #update" do
      put("/carreras/1").should route_to("carreras#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/carreras/1").should route_to("carreras#destroy", :id => "1")
    end

  end
end
