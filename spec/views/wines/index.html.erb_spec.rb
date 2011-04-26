require 'spec_helper'

describe "wines/index.html.erb" do
  before(:each) do
    assign(:wines, [
      stub_model(Wine,
        :winery_id => 1,
        :region_id => 1,
        :variety_id => 1,
        :name => "Name"
      ),
      stub_model(Wine,
        :winery_id => 1,
        :region_id => 1,
        :variety_id => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of wines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
