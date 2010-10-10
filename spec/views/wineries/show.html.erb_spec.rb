require 'spec_helper'

describe "wineries/show.html.erb" do
  before(:each) do
    @winery = assign(:winery, stub_model(Winery))
  end

  it "renders attributes in <p>" do
    render
  end
end
