Feature: Update user profile
  As a  User
  I want to update my profile
  So I can have the most updated information

  Background:
    Given a user with email "existing_user@stash.org" exists
      And I am logged in as "existing_user@stash.org"

  Scenario: Go to the edit profile page
    When I go to the User Edit Profile page for user "existing_user@stash.org"
    Then I should see edit profile fields

  Scenario: Update profile but not password with valid information
    When I go to the User Edit Profile page for user "existing_user@stash.org"
     When I fill in the following:
        | user_full_name | Andy Smith        |
        | user_email     | new_user@stash.org|
      And I press "Save Changes"
    Then I should see a flash notice with "You updated your account successfully"
    When I go to the Logout page
     And I go to the Login page
     And I submit the login form with email "new_user@stash.org" and password "password"
    Then I should be logged in

  # Scenario: Update password with valid information
  #   When I go to the edit profile page
  #    And I click the change password link
  #    And I submit my profile with the following "New Password: new_password, Confirm New Password: new_password, Current Password: password"
  #   Then I should see a flash notice with "You updated your account successfully"
  #   When I go to the Logout page
  #    And I go to the Login page
  #    And I submit the login form with email "existing_user@stash.org" and password "new_password"
  #   Then I should be logged in
  #
  # Scenario: Update profile without valid information
  #   When I go to the edit profile page
  #    And I submit my profile with the following "Full Name: Andy Smith, Email: new_user@stash.org"
  #   Then I should see a devise error "Current password can't be blank"

