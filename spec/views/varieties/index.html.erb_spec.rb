require 'spec_helper'

describe "varieties/index.html.erb" do
  before(:each) do
    assign(:varieties, [
      stub_model(Variety,
        :name => "Name",
        :wine_type => "Wine Type"
      ),
      stub_model(Variety,
        :name => "Name",
        :wine_type => "Wine Type"
      )
    ])
  end

  it "renders a list of varieties" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Wine Type".to_s, :count => 2
  end
end
