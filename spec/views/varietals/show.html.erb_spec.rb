require 'spec_helper'

describe "varietals/show.html.erb" do
  before(:each) do
    @varietal = assign(:varietal, stub_model(Varietal,
      :name => "Name",
      :grape => "Grape"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Grape/)
  end
end
