require 'spec_helper'

describe "varietals/index.html.erb" do
  before(:each) do
    assign(:varietals, [
      stub_model(Varietal,
        :name => "Name",
        :grape => "Grape"
      ),
      stub_model(Varietal,
        :name => "Name",
        :grape => "Grape"
      )
    ])
  end

  it "renders a list of varietals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Grape".to_s, :count => 2
  end
end
