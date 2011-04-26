require 'spec_helper'

describe "varieties/show.html.erb" do
  before(:each) do
    @variety = assign(:variety, stub_model(Variety,
      :name => "Name",
      :wine_type => "Wine Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Wine Type/)
  end
end
