require 'spec_helper'

describe "twitter_feeds/show.html.erb" do
  before(:each) do
    @twitter_feed = assign(:twitter_feed, stub_model(TwitterFeed,
      :screen_name => "Screen Name",
      :auth_token => "Auth Token",
      :auth_secret => "Auth Secret",
      :winery_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Screen Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Auth Token/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Auth Secret/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
