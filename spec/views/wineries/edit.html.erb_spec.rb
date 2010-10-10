require 'spec_helper'

describe "wineries/edit.html.erb" do
  before(:each) do
    @winery = assign(:winery, stub_model(Winery,
      :new_record? => false
    ))
  end

  it "renders the edit winery form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => winery_path(@winery), :method => "post" do
    end
  end
end
