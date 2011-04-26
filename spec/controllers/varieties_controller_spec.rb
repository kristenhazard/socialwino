require 'spec_helper'

describe VarietiesController do

  def mock_variety(stubs={})
    (@mock_variety ||= mock_model(Variety).as_null_object).tap do |variety|
      variety.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all varieties as @varieties" do
      Variety.stub(:all) { [mock_variety] }
      get :index
      assigns(:varieties).should eq([mock_variety])
    end
  end

  describe "GET show" do
    it "assigns the requested variety as @variety" do
      Variety.stub(:find).with("37") { mock_variety }
      get :show, :id => "37"
      assigns(:variety).should be(mock_variety)
    end
  end

  describe "GET new" do
    it "assigns a new variety as @variety" do
      Variety.stub(:new) { mock_variety }
      get :new
      assigns(:variety).should be(mock_variety)
    end
  end

  describe "GET edit" do
    it "assigns the requested variety as @variety" do
      Variety.stub(:find).with("37") { mock_variety }
      get :edit, :id => "37"
      assigns(:variety).should be(mock_variety)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created variety as @variety" do
        Variety.stub(:new).with({'these' => 'params'}) { mock_variety(:save => true) }
        post :create, :variety => {'these' => 'params'}
        assigns(:variety).should be(mock_variety)
      end

      it "redirects to the created variety" do
        Variety.stub(:new) { mock_variety(:save => true) }
        post :create, :variety => {}
        response.should redirect_to(variety_url(mock_variety))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved variety as @variety" do
        Variety.stub(:new).with({'these' => 'params'}) { mock_variety(:save => false) }
        post :create, :variety => {'these' => 'params'}
        assigns(:variety).should be(mock_variety)
      end

      it "re-renders the 'new' template" do
        Variety.stub(:new) { mock_variety(:save => false) }
        post :create, :variety => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested variety" do
        Variety.should_receive(:find).with("37") { mock_variety }
        mock_variety.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :variety => {'these' => 'params'}
      end

      it "assigns the requested variety as @variety" do
        Variety.stub(:find) { mock_variety(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:variety).should be(mock_variety)
      end

      it "redirects to the variety" do
        Variety.stub(:find) { mock_variety(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(variety_url(mock_variety))
      end
    end

    describe "with invalid params" do
      it "assigns the variety as @variety" do
        Variety.stub(:find) { mock_variety(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:variety).should be(mock_variety)
      end

      it "re-renders the 'edit' template" do
        Variety.stub(:find) { mock_variety(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested variety" do
      Variety.should_receive(:find).with("37") { mock_variety }
      mock_variety.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the varieties list" do
      Variety.stub(:find) { mock_variety }
      delete :destroy, :id => "1"
      response.should redirect_to(varieties_url)
    end
  end

end
