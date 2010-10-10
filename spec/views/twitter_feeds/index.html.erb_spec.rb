require 'spec_helper'

describe "twitter_feeds/index.html.erb" do
  before(:each) do
    assign(:twitter_feeds, [
      stub_model(TwitterFeed,
        :screen_name => "Screen Name",
        :auth_token => "Auth Token",
        :auth_secret => "Auth Secret",
        :winery_id => 1
      ),
      stub_model(TwitterFeed,
        :screen_name => "Screen Name",
        :auth_token => "Auth Token",
        :auth_secret => "Auth Secret",
        :winery_id => 1
      )
    ])
  end

  it "renders a list of twitter_feeds" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Auth Token".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Auth Secret".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
