require 'spec_helper'

describe "prelaunch_signups/new.html.erb" do
  before(:each) do
    assign(:prelaunch_signup, stub_model(PrelaunchSignup,
      :new_record? => true,
      :email => "MyString",
      :winery => false
    ))
  end

  it "renders new prelaunch_signup form" do
    render

    rendered.should have_selector("form", :action => prelaunch_signups_path, :method => "post") do |form|
      form.should have_selector("input#prelaunch_signup_email", :name => "prelaunch_signup[email]")
      form.should have_selector("input#prelaunch_signup_winery", :name => "prelaunch_signup[winery]")
    end
  end
end
