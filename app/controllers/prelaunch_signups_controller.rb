class PrelaunchSignupsController < ApplicationController
  
  before_filter :require_logged_in, :only => [:index, :destroy]
  
  layout "prelaunch_signup"
  
  def winemaker
    @prelaunch_signup = PrelaunchSignup.new
  end

  
  def index
    @prelaunch_signups = PrelaunchSignup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prelaunch_signups }
    end
  end
  
  def landing

  end

  def show
    @prelaunch_signup = PrelaunchSignup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prelaunch_signup }
    end
  end

  def new
    @prelaunch_signup = PrelaunchSignup.new
  end

  def edit
    @prelaunch_signup = PrelaunchSignup.find(params[:id])
  end

  def create
    @prelaunch_signup = PrelaunchSignup.new(params[:prelaunch_signup])

    respond_to do |format|
      if @prelaunch_signup.save
        format.html { redirect_to(@prelaunch_signup, :notice => 'Prelaunch signup was successfully created.') }
        format.xml  { render :xml => @prelaunch_signup, :status => :created, :location => @prelaunch_signup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prelaunch_signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @prelaunch_signup = PrelaunchSignup.find(params[:id])

    respond_to do |format|
      if @prelaunch_signup.update_attributes(params[:prelaunch_signup])
        format.html { redirect_to(@prelaunch_signup, :notice => 'Prelaunch signup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prelaunch_signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @prelaunch_signup = PrelaunchSignup.find(params[:id])
    @prelaunch_signup.destroy

    respond_to do |format|
      format.html { redirect_to(prelaunch_signups_url) }
      format.xml  { head :ok }
    end
  end
end
