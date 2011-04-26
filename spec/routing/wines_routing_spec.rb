require "spec_helper"

describe WinesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/wines" }.should route_to(:controller => "wines", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/wines/new" }.should route_to(:controller => "wines", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/wines/1" }.should route_to(:controller => "wines", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/wines/1/edit" }.should route_to(:controller => "wines", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/wines" }.should route_to(:controller => "wines", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/wines/1" }.should route_to(:controller => "wines", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/wines/1" }.should route_to(:controller => "wines", :action => "destroy", :id => "1")
    end

  end
end
