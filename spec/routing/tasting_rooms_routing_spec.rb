require "spec_helper"

describe TastingRoomsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tasting_rooms" }.should route_to(:controller => "tasting_rooms", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tasting_rooms/new" }.should route_to(:controller => "tasting_rooms", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tasting_rooms/1" }.should route_to(:controller => "tasting_rooms", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tasting_rooms/1/edit" }.should route_to(:controller => "tasting_rooms", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tasting_rooms" }.should route_to(:controller => "tasting_rooms", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tasting_rooms/1" }.should route_to(:controller => "tasting_rooms", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tasting_rooms/1" }.should route_to(:controller => "tasting_rooms", :action => "destroy", :id => "1")
    end

  end
end
