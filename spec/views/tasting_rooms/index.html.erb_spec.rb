require 'spec_helper'

describe "tasting_rooms/index.html.erb" do
  before(:each) do
    assign(:tasting_rooms, [
      stub_model(TastingRoom,
        :winery_id => 1,
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode"
      ),
      stub_model(TastingRoom,
        :winery_id => 1,
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode"
      )
    ])
  end

  it "renders a list of tasting_rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
  end
end
