require 'spec_helper'

describe VarietalsController do

  def mock_varietal(stubs={})
    (@mock_varietal ||= mock_model(Varietal).as_null_object).tap do |varietal|
      varietal.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all varietals as @varietals" do
      Varietal.stub(:all) { [mock_varietal] }
      get :index
      assigns(:varietals).should eq([mock_varietal])
    end
  end

  describe "GET show" do
    it "assigns the requested varietal as @varietal" do
      Varietal.stub(:find).with("37") { mock_varietal }
      get :show, :id => "37"
      assigns(:varietal).should be(mock_varietal)
    end
  end

  describe "GET new" do
    it "assigns a new varietal as @varietal" do
      Varietal.stub(:new) { mock_varietal }
      get :new
      assigns(:varietal).should be(mock_varietal)
    end
  end

  describe "GET edit" do
    it "assigns the requested varietal as @varietal" do
      Varietal.stub(:find).with("37") { mock_varietal }
      get :edit, :id => "37"
      assigns(:varietal).should be(mock_varietal)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created varietal as @varietal" do
        Varietal.stub(:new).with({'these' => 'params'}) { mock_varietal(:save => true) }
        post :create, :varietal => {'these' => 'params'}
        assigns(:varietal).should be(mock_varietal)
      end

      it "redirects to the created varietal" do
        Varietal.stub(:new) { mock_varietal(:save => true) }
        post :create, :varietal => {}
        response.should redirect_to(varietal_url(mock_varietal))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved varietal as @varietal" do
        Varietal.stub(:new).with({'these' => 'params'}) { mock_varietal(:save => false) }
        post :create, :varietal => {'these' => 'params'}
        assigns(:varietal).should be(mock_varietal)
      end

      it "re-renders the 'new' template" do
        Varietal.stub(:new) { mock_varietal(:save => false) }
        post :create, :varietal => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested varietal" do
        Varietal.should_receive(:find).with("37") { mock_varietal }
        mock_varietal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :varietal => {'these' => 'params'}
      end

      it "assigns the requested varietal as @varietal" do
        Varietal.stub(:find) { mock_varietal(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:varietal).should be(mock_varietal)
      end

      it "redirects to the varietal" do
        Varietal.stub(:find) { mock_varietal(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(varietal_url(mock_varietal))
      end
    end

    describe "with invalid params" do
      it "assigns the varietal as @varietal" do
        Varietal.stub(:find) { mock_varietal(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:varietal).should be(mock_varietal)
      end

      it "re-renders the 'edit' template" do
        Varietal.stub(:find) { mock_varietal(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested varietal" do
      Varietal.should_receive(:find).with("37") { mock_varietal }
      mock_varietal.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the varietals list" do
      Varietal.stub(:find) { mock_varietal }
      delete :destroy, :id => "1"
      response.should redirect_to(varietals_url)
    end
  end

end
