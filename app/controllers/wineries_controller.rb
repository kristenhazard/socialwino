class WineriesController < ApplicationController
  
  before_filter :require_logged_in
  
  def index
    @wineries = Winery.all
  end
  
  def show
    @winery = Winery.find(params[:id])
  end

  def new
    @winery = Winery.new
    3.times do
      twitter_feed = @winery.twitter_feeds.build
    end
  end

  def edit
    @winery = Winery.find(params[:id])
    @twitter_feeds = @winery.twitter_feeds
    logger.debug @twitter_feeds
    if @twitter_feeds.empty?
      3.times do
        twitter_feed = @winery.twitter_feeds.build
      end
    end
  end

  def create
    @winery = Winery.new(params[:winery])

    respond_to do |format|
      if @winery.save
        format.html { redirect_to(@winery, :notice => 'Winery was successfully created.') }
        format.xml  { render :xml => @winery, :status => :created, :location => @winery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @winery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @winery = Winery.find(params[:id])

    respond_to do |format|
      if @winery.update_attributes(params[:winery])
        format.html { redirect_to(@winery, :notice => 'Winery was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @winery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @winery = Winery.find(params[:id])
    @winery.destroy

    respond_to do |format|
      format.html { redirect_to(wineries_url) }
      format.xml  { head :ok }
    end
  end
end
