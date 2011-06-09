Feature:  Sign up a consumer account
  As a consumer
  I want to sign up for an account
  So I can purchase coupons

  Background:
    Given a role named "consumer" exists

  Scenario: Sign up a user with valid information
    Given I am on the Sign Up page
    Then show me the page
     When I submit the sign up form with valid information
     Then I should see a flash notice with "You have signed up successfully"
      And the new user with email "new_user@bcm.tv" should be created as a "consumer"
      #And "new_user@bcm.tv" should receive an email with subject "Welcome to Stash-n-Share!"

  Scenario: Sign up using an existing email address
    Given a user with email "existing_user@bcm.tv" exist
      And I am on the Sign Up page
     When I fill in "Email" with "existing_user@bcm.tv"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "password"
      And I press "submit"
     Then I should see a devise error "Email has already been taken"

  Scenario: Sign up using unmatch password
      And I am on the Sign Up page
     When I fill in "Email" with "new_user@bcm.tv"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "new_password"
      And I press "submit"
     Then I should see a devise error "Password doesn't match confirmation"

  @selenium
  Scenario: Sign up using ajax
    When I go to the home page
     And I follow "sign up"
     And I wait for 2 seconds
    Then I should see the ajax form
    When I press "submit"
     And I wait for 1 seconds
    Then I should not be logged in
     And I should see "3 errors prohibited this user from being saved" in the ajax form
    When I submit the sign up form with valid information
    Then I should be logged in
     And I should see "You have signed up successfully"



