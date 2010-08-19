class PrelaunchSignupsController < ApplicationController
  
  before_filter :require_logged_in, :only => [:index, :destroy]
  
  layout "prelaunch_signup"
  
  def index
    @prelaunch_signups = PrelaunchSignup.all
  end

  def show
    @prelaunch_signup = PrelaunchSignup.find(params[:id])
  end

  def new
    @prelaunch_signup = PrelaunchSignup.new
    @prelaunch_signup.winery = false
  end

  def edit
    @prelaunch_signup = PrelaunchSignup.find(params[:id])
  end

  def create
    @prelaunch_signup = PrelaunchSignup.new(params[:prelaunch_signup])
    #logger.debug "winery: #{@prelaunch_signup.winery}"
    if @prelaunch_signup.save
      redirect_to(@prelaunch_signup, :notice => 'Prelaunch signup was successfully created.') 
    else
      if @prelaunch_signup.winery == true
        #logger.debug "winery winemaker: #{@prelaunch_signup.winery}"
        render :action => "winemaker" 
      else
        #logger.debug "winery wino: #{@prelaunch_signup.winery}"
        render :action => "new" 
      end
    end
  end

  def update
    @prelaunch_signup = PrelaunchSignup.find(params[:id])
    if @prelaunch_signup.update_attributes(params[:prelaunch_signup])
      redirect_to(@prelaunch_signup, :notice => 'Prelaunch signup was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @prelaunch_signup = PrelaunchSignup.find(params[:id])
    @prelaunch_signup.destroy
    redirect_to(prelaunch_signups_url)
  end
  
  # landing page is static, doesn't need to be part of prelaunch_signups
  def landing

  end
  
  # separate new page for winemakers so I can track on google analytics
  def winemaker
    @prelaunch_signup = PrelaunchSignup.new
    @prelaunch_signup.winery = true
  end
  
end
