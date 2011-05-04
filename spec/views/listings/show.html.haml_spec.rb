require 'spec_helper'

describe "listings/show.html.haml" do
  before(:each) do
    @listing = assign(:listing, stub_model(Listing))
  end

  it "renders attributes in <p>" do
    render
  end
end
