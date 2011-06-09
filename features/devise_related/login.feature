Feature:  Login to my account
  As a consumer
  I want to login to my account
  So I can view and share stashes

  Background:
    Given a role named "consumer" exists
      And a user with email "me@example.com" exists
      And an Admin user with email "admin@stashns.com" exists

  Scenario: Login with valid information
    When I go to the Login page
     When I fill in "user_email" with "me@example.com"
     And I fill in "user_password" with "password"
     And I press "Log me in!"
    Then I should be logged in
     And I should see "Signed in successfully"

  Scenario: Login with invalid information
    When I go to the Login page
     When I fill in "user_email" with "me@example.com"
      And I fill in "user_password" with "wrong_password"
      And I press "Log me in!"
    Then I should not be logged in
     And I should see "Invalid email or password"

  Scenario: Login with valid information and remember me
    When I go to the Login page
     When I fill in "user_email" with "me@example.com"
     And I fill in "user_password" with "password"
     And I check "Remember me"
     And I press "Log me in!"
    Then I should be logged in
     And I should see "Signed in successfully"
    When I close my browser
     And I come back next time
    Then I should be logged in

  Scenario: Login with valid information and without checking remember me
    When I go to the Login page
     When I fill in "user_email" with "me@example.com"
      And I fill in "user_password" with "password"
      And I press "Log me in!"
    Then I should be logged in
     And I should see "Signed in successfully"
    When I close my browser
     And I come back next time
    Then I should not be logged in

  Scenario: Admin user logs in
    When I go to the Login page
    And I fill in "user_email" with "admin@stashns.com"
    And I fill in "user_password" with "password"
    And I press "Log me in!"
    Then I should be logged in
    And I should see "Signed in successfully"
    And I should see "User Info"


