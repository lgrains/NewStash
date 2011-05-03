Feature:  Login to my account
  As a consumer
  I want to login to my account
  So I can purchase coupons

  Background:
    Given a role named "consumer" exist
      And a user with email "existing_user@bcm.tv" exist

  Scenario: Login with valid information
    When I go to the Login page
     And I submit the login form with email "existing_user@bcm.tv" and password "password"
    Then I should be logged in
     And I should see "Signed in successfully"

  Scenario: Login with invalid information
    When I go to the Login page
     And I submit the login form with email "existing_user@bcm.tv" and password "new_password"
    Then I should not be logged in
     And I should see "Invalid email or password"

  Scenario: Login with valid information and remember me
    When I go to the Login page
     And I submit the login form with email "existing_user@bcm.tv" and password "password" and "checked" remember me
    Then I should be logged in
     And I should see "Signed in successfully"
    When I close my browser
     And I come back next time
    Then I should be logged in

  Scenario: Login with valid information and without checking remember me
    When I go to the Login page
     And I submit the login form with email "existing_user@bcm.tv" and password "password" and "not checked" remember me
    Then I should be logged in
     And I should see "Signed in successfully"
    When I close my browser
     And I come back next time
    Then I should not be logged in

  Scenario: A merchant user logs in
    Given a role named "merchant" exist
      And there is a Merchant called "my merchant"
      And there is a user with email "existing_merchant_user@bcm.tv" for merchant "my merchant"
     When I go to the Login page
      And I submit the login form with email "existing_merchant_user@bcm.tv" and password "password"
     Then I should be logged in
      And I should see "Signed in successfully"

  @selenium
  Scenario: Login using ajax
    When I go to the home page
     And I follow "log in"
     And I wait for 2 seconds
    Then I should see the ajax form
    When I submit the login form with email "existing_user@bcm.tv" and password "new_password"
     And I wait for 1 seconds
    Then I should not be logged in
     And I should see "Invalid email or password" in the ajax form
    When I submit the login form with email "existing_user@bcm.tv" and password "password"
    Then I should be logged in
     And I should see "Signed in successfully"