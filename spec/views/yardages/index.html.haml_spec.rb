require 'spec_helper'

describe "yardages/index.html.haml" do
  before(:each) do
    assign(:yardages, [
      stub_model(Yardage,
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
      ),
      stub_model(Yardage,
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
      )
    ])
  end

  it "renders a list of yardages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fabric Line Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fabric Designer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
