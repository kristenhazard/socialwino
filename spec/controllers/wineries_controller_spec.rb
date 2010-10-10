require 'spec_helper'

describe WineriesController do

  def mock_winery(stubs={})
    @mock_winery ||= mock_model(Winery, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all wineries as @wineries" do
      Winery.stub(:all) { [mock_winery] }
      get :index
      assigns(:wineries).should eq([mock_winery])
    end
  end

  describe "GET show" do
    it "assigns the requested winery as @winery" do
      Winery.stub(:find).with("37") { mock_winery }
      get :show, :id => "37"
      assigns(:winery).should be(mock_winery)
    end
  end

  describe "GET new" do
    it "assigns a new winery as @winery" do
      Winery.stub(:new) { mock_winery }
      get :new
      assigns(:winery).should be(mock_winery)
    end
  end

  describe "GET edit" do
    it "assigns the requested winery as @winery" do
      Winery.stub(:find).with("37") { mock_winery }
      get :edit, :id => "37"
      assigns(:winery).should be(mock_winery)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created winery as @winery" do
        Winery.stub(:new).with({'these' => 'params'}) { mock_winery(:save => true) }
        post :create, :winery => {'these' => 'params'}
        assigns(:winery).should be(mock_winery)
      end

      it "redirects to the created winery" do
        Winery.stub(:new) { mock_winery(:save => true) }
        post :create, :winery => {}
        response.should redirect_to(winery_url(mock_winery))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved winery as @winery" do
        Winery.stub(:new).with({'these' => 'params'}) { mock_winery(:save => false) }
        post :create, :winery => {'these' => 'params'}
        assigns(:winery).should be(mock_winery)
      end

      it "re-renders the 'new' template" do
        Winery.stub(:new) { mock_winery(:save => false) }
        post :create, :winery => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested winery" do
        Winery.should_receive(:find).with("37") { mock_winery }
        mock_winery.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :winery => {'these' => 'params'}
      end

      it "assigns the requested winery as @winery" do
        Winery.stub(:find) { mock_winery(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:winery).should be(mock_winery)
      end

      it "redirects to the winery" do
        Winery.stub(:find) { mock_winery(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(winery_url(mock_winery))
      end
    end

    describe "with invalid params" do
      it "assigns the winery as @winery" do
        Winery.stub(:find) { mock_winery(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:winery).should be(mock_winery)
      end

      it "re-renders the 'edit' template" do
        Winery.stub(:find) { mock_winery(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested winery" do
      Winery.should_receive(:find).with("37") { mock_winery }
      mock_winery.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the wineries list" do
      Winery.stub(:find) { mock_winery }
      delete :destroy, :id => "1"
      response.should redirect_to(wineries_url)
    end
  end

end
