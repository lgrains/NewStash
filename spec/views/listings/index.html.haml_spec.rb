require 'spec_helper'

describe "listings/index.html.haml" do
  before(:each) do
    assign(:listings, [
      stub_model(Listing),
      stub_model(Listing)
    ])
  end

  it "renders a list of listings" do
    render
  end
end
