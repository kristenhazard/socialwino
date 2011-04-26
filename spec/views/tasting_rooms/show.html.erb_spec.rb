require 'spec_helper'

describe "tasting_rooms/show.html.erb" do
  before(:each) do
    @tasting_room = assign(:tasting_room, stub_model(TastingRoom,
      :winery_id => 1,
      :name => "Name",
      :address => "Address",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zipcode/)
  end
end
