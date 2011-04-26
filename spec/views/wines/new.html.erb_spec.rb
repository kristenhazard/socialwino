require 'spec_helper'

describe "wines/new.html.erb" do
  before(:each) do
    assign(:wine, stub_model(Wine,
      :winery_id => 1,
      :region_id => 1,
      :variety_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new wine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wines_path, :method => "post" do
      assert_select "input#wine_winery_id", :name => "wine[winery_id]"
      assert_select "input#wine_region_id", :name => "wine[region_id]"
      assert_select "input#wine_variety_id", :name => "wine[variety_id]"
      assert_select "input#wine_name", :name => "wine[name]"
    end
  end
end
