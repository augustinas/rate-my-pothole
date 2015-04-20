Feature: A user can sign in
  In order to post a pothole
  As a user
  I want to be able to sign in

  Background:
    Given I sign up

  Scenario: A user signs out
    When I press "Sign out"
    Then I should see "Goodbye, citizen1"
    And I should see "Sign up"
    And I should see "Sign in"
    And I should not see "Sign out"

  Scenario: A user signs in
    When I press "Sign out"
    And I press "Sign in"
    And I fill in "username" with "citizen1"
    And I fill in "password" with "ra88it"
    And I press "Login"
    Then I should see "Welcome, citizen1!"
    And I should not see "Sign up"
    And I should not see "Sign in"
    And I should see "Sign out"

  Scenario: A user signs in with incorrect details
    When I press "Sign out"
    And I press "Sign in"
    And I fill in "username" with "citizen1"
    And I fill in "password" with "ra8it"
    And I press "Login"
    Then I should see "Username or password are incorrect"
