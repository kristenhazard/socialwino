require 'spec_helper'

describe "prelaunch_signups/show.html.erb" do
  before(:each) do
    @prelaunch_signup = assign(:prelaunch_signup, stub_model(PrelaunchSignup,
      :email => "Email",
      :winery => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Email".to_s)
    rendered.should contain(false.to_s)
  end
end
