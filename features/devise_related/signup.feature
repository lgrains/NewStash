Feature:  Sign up a consumer account
  As a consumer
  I want to sign up for an account
  So I can purchase coupons

  Background:
    Given a role named "consumer" exists

  Scenario: Sign up a user with valid information
    Given I am on the Sign Up page
     When I fill in "Full name" with "Daisy Quilter"
     And I fill in "Email" with "dquilter@stash.com"
     And I fill in "Zip" with "01821"
     And I fill in "Password" with "password"
     And I fill in "Password confirmation" with "password"
     And I press "Sign Me Up!"
     Then I should see "You have signed up successfully"
      And the new user with email "dquilter@stash.com" should be created as a "consumer"
      #And "dquilter@stash.comm" should receive an email with subject "Welcome to Stash-n-Share!"

  Scenario: Sign up using an existing email address
    Given a user with email "dquilter@stash.com" exist
      And I am on the Sign Up page
     When I fill in "Email" with "dquilter@stash.com"
     And I fill in "Zip" with "84109"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "password"
      And I press "Sign Me Up!"
     Then I should see a devise error "Email has already been taken"

  Scenario: Sign up using unmatch password
      And I am on the Sign Up page
     When I fill in "Email" with "new_user@stash.com"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "new_password"
      And I press "Sign Me Up!"
     Then I should see a devise error "Password doesn't match confirmation"


  Scenario: Sign up without values in fields
    When I go to the home page
     And I follow "Not a member? Sign up now!"
    When I press "Sign Me Up!"
    Then I should see "3 errors prohibited this user from being saved"

