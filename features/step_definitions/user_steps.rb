Given /^the following users exist:$/ do |table|
  table.hashes.each do |hash|
    Factory(:user, hash)
  end
end

Given /^an Admin user with email "([^"]*)" exists?$/ do |email|
  role = Role.find_by_name("admin") || Factory(:role, :name => "admin")
  Factory(:user, :email => email, :role => role)
end

Given /^a user with email "([^"]*)" exists?$/ do |email|
  Factory(:user, :email => email)
end

Given /^a user with email "([^"]*)" and full name "([^"]*)" exists$/ do |email, full_name|
  Factory(:user, :email => email, :full_name => full_name)
end

Given /^there is a user with email "([^"]*)" for merchant "([^"]*)"$/ do |email, merchant_name|
  user = Factory.build(:user, :email => email, :password => 'password')
  user.role = Role.find_by_name("merchant") || Factory(:role, :name => "merchant")
  user.merchant = Merchant.find_by_name(merchant_name) || Factory(:merchant, :name => merchant_name)
  user.save!
end

Given /^user "([^"]*)" has (\d+) credits$/ do |email, num_credits|
  user = User.find_by_email(email)
  Factory(:credit, :amount => num_credits, :user => user)
end


When /^I submit the merchant user form with valid information$/ do
  within "form" do
    fill_in "Full Name", :with => "New User"
    fill_in "Email", :with => "new_merchant_user@bcm.tv"
    fill_in "Password", :with => "password"
    fill_in "Confirm Password", :with => "password"
    click_button "Create User"
  end
end

When /^I upload an image for the user profile$/ do
  When %{I attach the file "spec/fixtures/black_math.jpg" to "image[image]"}
   And %{I press "Submit"}
end

Then /^I should be registered with email "([^"]*)"$/ do |email|
  User.find_by_email(email).email.should == email
end

Then /^the new user with email "([^"]*)" should be created as a "([^"]*)"$/ do |email, role|
  user = User.find_by_email(email)
  user.should_not be_nil
  user.role.name.should == role
end

Then /^the new user with email "([^"]*)" should not be created in the database$/ do |email|
  user = User.find_by_email(email)
  user.should be_nil
end

Then /^user "([^"]*)" should be deleted$/ do |email|
  user = User.find_by_email(email)
  user.should be_nil
end

Then /^the user "([^"]*)" active should be "([^"]*)"$/ do |email, active_value|
  contact = MailingList.find_by_email(email)
  contact.active.should be_true
end

Then /^I should see the new uploaded image as my profile picture$/ do
  find(".image img")["alt"].should == "Black_math"
end

Then /^the light box should show up with the upload image form$/ do
  Then %{I should see "Upload profile picture" within "#facebox"}
end



