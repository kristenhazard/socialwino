require 'spec_helper'

describe "varietals/edit.html.erb" do
  before(:each) do
    @varietal = assign(:varietal, stub_model(Varietal,
      :name => "MyString",
      :grape => "MyString"
    ))
  end

  it "renders the edit varietal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => varietal_path(@varietal), :method => "post" do
      assert_select "input#varietal_name", :name => "varietal[name]"
      assert_select "input#varietal_grape", :name => "varietal[grape]"
    end
  end
end
