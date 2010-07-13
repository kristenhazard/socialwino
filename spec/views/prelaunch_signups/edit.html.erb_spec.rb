require 'spec_helper'

describe "prelaunch_signups/edit.html.erb" do
  before(:each) do
    @prelaunch_signup = assign(:prelaunch_signup, stub_model(PrelaunchSignup,
      :new_record? => false,
      :email => "MyString",
      :winery => false
    ))
  end

  it "renders the edit prelaunch_signup form" do
    render

    rendered.should have_selector("form", :action => prelaunch_signup_path(@prelaunch_signup), :method => "post") do |form|
      form.should have_selector("input#prelaunch_signup_email", :name => "prelaunch_signup[email]")
      form.should have_selector("input#prelaunch_signup_winery", :name => "prelaunch_signup[winery]")
    end
  end
end
