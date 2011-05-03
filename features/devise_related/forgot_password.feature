Feature:  Reset Password
  As a consumer
  I want to reset my password because I forgot my password
  So I can login to use my account

  Background:
    Given a role named "consumer" exists
      And a user with email "existing_user@bcm.tv" exists

  Scenario: Submit an exist email
    Given I am on the Login page
     When I follow "Forgot your password?"
     Then I should be on the forgot password page
      And I submit the forgot password form with email address "existing_user@bcm.tv"
     Then I should be on the Login page
      And I should see a flash notice with "You will receive an email with instructions about how to reset your password in a few minutes"
      And "existing_user@bcm.tv" should receive an email with subject "Reset password instructions"
     When I open the email with subject "Reset password instructions"
      And I follow "Change my password" in the email
     Then I should be on the reset password page
     When I submit the edit password form with a new password "new_password"
     Then I should be logged in
     When I go to the Logout page
     Then I should not be logged in
     When I go to the Login page
      And I submit the login form with email "existing_user@bcm.tv" and password "new_password"
     Then I should be logged in

  Scenario: Submit an email which is not exist in our database
    When I go to the forgot password page
     And I submit the forgot password form with email address "new_user@bcm.tv"
    Then I should see a devise error "Email not found"

  Scenario: Submit an empty email address
    When I go to the forgot password page
     And I submit the forgot password form with email address ""
    Then I should see a devise error "Email can't be blank"