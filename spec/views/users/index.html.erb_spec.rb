require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :username => "Username",
        :email => "Email"
      ),
      stub_model(User,
        :name => "Name",
        :username => "Username",
        :email => "Email"
      )
    ])
  end

  it "renders a list of users" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Username".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Email".to_s, :count => 2)
  end
end
