require 'spec_helper'

describe WinesController do

  def mock_wine(stubs={})
    (@mock_wine ||= mock_model(Wine).as_null_object).tap do |wine|
      wine.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all wines as @wines" do
      Wine.stub(:all) { [mock_wine] }
      get :index
      assigns(:wines).should eq([mock_wine])
    end
  end

  describe "GET show" do
    it "assigns the requested wine as @wine" do
      Wine.stub(:find).with("37") { mock_wine }
      get :show, :id => "37"
      assigns(:wine).should be(mock_wine)
    end
  end

  describe "GET new" do
    it "assigns a new wine as @wine" do
      Wine.stub(:new) { mock_wine }
      get :new
      assigns(:wine).should be(mock_wine)
    end
  end

  describe "GET edit" do
    it "assigns the requested wine as @wine" do
      Wine.stub(:find).with("37") { mock_wine }
      get :edit, :id => "37"
      assigns(:wine).should be(mock_wine)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created wine as @wine" do
        Wine.stub(:new).with({'these' => 'params'}) { mock_wine(:save => true) }
        post :create, :wine => {'these' => 'params'}
        assigns(:wine).should be(mock_wine)
      end

      it "redirects to the created wine" do
        Wine.stub(:new) { mock_wine(:save => true) }
        post :create, :wine => {}
        response.should redirect_to(wine_url(mock_wine))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved wine as @wine" do
        Wine.stub(:new).with({'these' => 'params'}) { mock_wine(:save => false) }
        post :create, :wine => {'these' => 'params'}
        assigns(:wine).should be(mock_wine)
      end

      it "re-renders the 'new' template" do
        Wine.stub(:new) { mock_wine(:save => false) }
        post :create, :wine => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested wine" do
        Wine.should_receive(:find).with("37") { mock_wine }
        mock_wine.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :wine => {'these' => 'params'}
      end

      it "assigns the requested wine as @wine" do
        Wine.stub(:find) { mock_wine(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:wine).should be(mock_wine)
      end

      it "redirects to the wine" do
        Wine.stub(:find) { mock_wine(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(wine_url(mock_wine))
      end
    end

    describe "with invalid params" do
      it "assigns the wine as @wine" do
        Wine.stub(:find) { mock_wine(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:wine).should be(mock_wine)
      end

      it "re-renders the 'edit' template" do
        Wine.stub(:find) { mock_wine(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested wine" do
      Wine.should_receive(:find).with("37") { mock_wine }
      mock_wine.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the wines list" do
      Wine.stub(:find) { mock_wine }
      delete :destroy, :id => "1"
      response.should redirect_to(wines_url)
    end
  end

end
