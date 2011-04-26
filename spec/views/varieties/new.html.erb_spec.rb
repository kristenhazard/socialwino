require 'spec_helper'

describe "varieties/new.html.erb" do
  before(:each) do
    assign(:variety, stub_model(Variety,
      :name => "MyString",
      :wine_type => "MyString"
    ).as_new_record)
  end

  it "renders new variety form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => varieties_path, :method => "post" do
      assert_select "input#variety_name", :name => "variety[name]"
      assert_select "input#variety_wine_type", :name => "variety[wine_type]"
    end
  end
end
