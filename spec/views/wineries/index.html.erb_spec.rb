require 'spec_helper'

describe "wineries/index.html.erb" do
  before(:each) do
    assign(:wineries, [
      stub_model(Winery),
      stub_model(Winery)
    ])
  end

  it "renders a list of wineries" do
    render
  end
end
