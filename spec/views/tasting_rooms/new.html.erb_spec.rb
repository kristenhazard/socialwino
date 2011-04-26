require 'spec_helper'

describe "tasting_rooms/new.html.erb" do
  before(:each) do
    assign(:tasting_room, stub_model(TastingRoom,
      :winery_id => 1,
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString"
    ).as_new_record)
  end

  it "renders new tasting_room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasting_rooms_path, :method => "post" do
      assert_select "input#tasting_room_winery_id", :name => "tasting_room[winery_id]"
      assert_select "input#tasting_room_name", :name => "tasting_room[name]"
      assert_select "input#tasting_room_address", :name => "tasting_room[address]"
      assert_select "input#tasting_room_city", :name => "tasting_room[city]"
      assert_select "input#tasting_room_state", :name => "tasting_room[state]"
      assert_select "input#tasting_room_zipcode", :name => "tasting_room[zipcode]"
    end
  end
end
