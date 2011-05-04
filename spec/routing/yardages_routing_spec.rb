require "spec_helper"

describe YardagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/yardages" }.should route_to(:controller => "yardages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/yardages/new" }.should route_to(:controller => "yardages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/yardages/1" }.should route_to(:controller => "yardages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/yardages/1/edit" }.should route_to(:controller => "yardages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/yardages" }.should route_to(:controller => "yardages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/yardages/1" }.should route_to(:controller => "yardages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/yardages/1" }.should route_to(:controller => "yardages", :action => "destroy", :id => "1")
    end

  end
end
