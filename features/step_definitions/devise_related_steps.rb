Given /^I am not logged in$/ do
  visit(destroy_user_session_path)
end

Given /^I am logged in as "([^\"]*)"$/ do |user_email|
  user = User.find_by_email(user_email) || Factory(:user, :email => user_email)
  login(user)
end

Given /^I am logged in as the BCM Admin$/ do
  role = Role.find_by_name("admin") || Factory(:role)
  user = User.find_by_email("admin@bcm.tv") || Factory(:admin, :role => role, :email => "admin@bcm.tv")
  login(user)
end

When /^I logged out$/ do
  visit(destroy_user_session_path)
end

When /^I submit the sign up form with valid information$/ do
  within "form" do
    fill_in "Full name", :with => "First Last"
    fill_in "Zip", :with => "02110"
    fill_in "Email", :with => "new_user@bcm.tv"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "submit"
  end
end

When /^I submit the login form with email "([^\"]*)" and password "([^\"]*)"(?: and "([^\"]*)" remember me)?$/ do |email, password, checked|
  within "form" do
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    check "Remember me" if checked == "checked"
    click_button "submit"
  end
end

When /^I submit the forgot password form with email address "([^\"]*)"$/ do |email|
  within "form" do
    fill_in "Email", :with => email
    click_button "Send me reset password instructions"
  end
end

When /^I submit the edit password form with a new password "([^\"]*)"$/ do |new_pass|
  within "form" do
    fill_in "Password", :with => new_pass
    fill_in "Password confirmation", :with => new_pass
    click_button "Change my password"
  end
end

When /^I submit my profile with the following "([^\"]*)"$/ do |data|
  When %{I fill in the form with the following "#{data}"}
  click_button "submit"
end

When /^I click the change password link$/ do
  find('.profile_change_password').click
end

Then /^I should see a devise error "([^\"]*)"$/ do |message|
  Then %{I should see "#{message}" within "#error_explanation"}
end

Then /^I should (not )?see the ajax form$/ do |status|
  if status
    page.should_not have_selector("#ajax_form .ajax_content")
  else
    page.should have_selector("#ajax_form .ajax_content")
  end
end

Then /^I should see "([^\"]*)" in the ajax form$/ do |text|
  within "#ajax_form" do
    page.should have_content(text)
  end
end

Then /^I should see edit profile fields$/ do
  ["user[full_name]", "user[email]", "user[street_address]", "user[city]", "user[state]", "user[zip]", "user[phone]"].each do |x|
    Then %{I should see the "#{x}" field in the form}
  end
end



def login(user)
  visit path_to("the Login page")
  fill_in("Email", :with => user.email)
  fill_in("Password", :with => 'password')
  click_button("submit")
end

