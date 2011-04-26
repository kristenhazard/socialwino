require 'spec_helper'

describe "varieties/edit.html.erb" do
  before(:each) do
    @variety = assign(:variety, stub_model(Variety,
      :name => "MyString",
      :wine_type => "MyString"
    ))
  end

  it "renders the edit variety form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => variety_path(@variety), :method => "post" do
      assert_select "input#variety_name", :name => "variety[name]"
      assert_select "input#variety_wine_type", :name => "variety[wine_type]"
    end
  end
end
