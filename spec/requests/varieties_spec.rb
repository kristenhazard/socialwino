require 'spec_helper'

describe "Varieties" do
  describe "GET /varieties" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get varieties_path
      response.status.should be(200)
    end
  end
end
