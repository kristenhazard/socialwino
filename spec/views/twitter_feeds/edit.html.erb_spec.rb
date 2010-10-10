require 'spec_helper'

describe "twitter_feeds/edit.html.erb" do
  before(:each) do
    @twitter_feed = assign(:twitter_feed, stub_model(TwitterFeed,
      :new_record? => false,
      :screen_name => "MyString",
      :auth_token => "MyString",
      :auth_secret => "MyString",
      :winery_id => 1
    ))
  end

  it "renders the edit twitter_feed form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => twitter_feed_path(@twitter_feed), :method => "post" do
      assert_select "input#twitter_feed_screen_name", :name => "twitter_feed[screen_name]"
      assert_select "input#twitter_feed_auth_token", :name => "twitter_feed[auth_token]"
      assert_select "input#twitter_feed_auth_secret", :name => "twitter_feed[auth_secret]"
      assert_select "input#twitter_feed_winery_id", :name => "twitter_feed[winery_id]"
    end
  end
end
