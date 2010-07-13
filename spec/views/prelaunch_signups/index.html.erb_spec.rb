require 'spec_helper'

describe "prelaunch_signups/index.html.erb" do
  before(:each) do
    assign(:prelaunch_signups, [
      stub_model(PrelaunchSignup,
        :email => "Email",
        :winery => false
      ),
      stub_model(PrelaunchSignup,
        :email => "Email",
        :winery => false
      )
    ])
  end

  it "renders a list of prelaunch_signups" do
    render
    rendered.should have_selector("tr>td", :content => "Email".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
  end
end
