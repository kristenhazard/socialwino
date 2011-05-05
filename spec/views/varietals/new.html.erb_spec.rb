require 'spec_helper'

describe "varietals/new.html.erb" do
  before(:each) do
    assign(:varietal, stub_model(Varietal,
      :name => "MyString",
      :grape => "MyString"
    ).as_new_record)
  end

  it "renders new varietal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => varietals_path, :method => "post" do
      assert_select "input#varietal_name", :name => "varietal[name]"
      assert_select "input#varietal_grape", :name => "varietal[grape]"
    end
  end
end
