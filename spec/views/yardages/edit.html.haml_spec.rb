require 'spec_helper'

describe "yardages/edit.html.haml" do
  before(:each) do
    @yardage = assign(:yardage, stub_model(Yardage,
      :title => "MyString",
      :description => "MyText",
      :length => 1.5,
      :width => 1.5,
      :cost_per_yard => "9.99",
      :treatment_method => 1,
      :manufacturer => "MyString",
      :fabric_line_name => "MyString",
      :fabric_designer => "MyString",
      :fabric_type => 1
    ))
  end

  it "renders the edit yardage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => yardages_path(@yardage), :method => "post" do
      assert_select "input#yardage_title", :name => "yardage[title]"
      assert_select "textarea#yardage_description", :name => "yardage[description]"
      assert_select "input#yardage_length", :name => "yardage[length]"
      assert_select "input#yardage_width", :name => "yardage[width]"
      assert_select "input#yardage_cost_per_yard", :name => "yardage[cost_per_yard]"
      assert_select "input#yardage_treatment_method", :name => "yardage[treatment_method]"
      assert_select "input#yardage_manufacturer", :name => "yardage[manufacturer]"
      assert_select "input#yardage_fabric_line_name", :name => "yardage[fabric_line_name]"
      assert_select "input#yardage_fabric_designer", :name => "yardage[fabric_designer]"
      assert_select "input#yardage_fabric_type", :name => "yardage[fabric_type]"
    end
  end
end
