require 'spec_helper'

describe "yardages/show.html.haml" do
  before(:each) do
    @yardage = assign(:yardage, stub_model(Yardage,
      :title => "Title",
      :description => "MyText",
      :length => 1.5,
      :width => 1.5,
      :cost_per_yard => "9.99",
      :treatment_method => 1,
      :manufacturer => "Manufacturer",
      :fabric_line_name => "Fabric Line Name",
      :fabric_designer => "Fabric Designer",
      :fabric_type => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Manufacturer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fabric Line Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fabric Designer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
