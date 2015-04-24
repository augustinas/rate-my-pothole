Feature: Pothole Ordering.
  In order to keep uptodate on potholes.
  As a User.
  I'd like to see them in various orders.

  Background:
    Given I sign up
    Given I post a pothole

  Scenario: Potholes displayed by flag order
    Given I am on the homepage
    And I post a pothole on "Another Rd"
    And I press "Flag" on pothole "1"
    Then "Leeds Rd" should be before "Another Rd"

  Scenario: Potholes displayed by flag time
    Given I am on the homepage
    And I post a pothole on "Another Rd"
    And I press "Flag" on pothole "1"
    Given I press "Sign out"
    Given I sign up as "Donald"
    And I press "Flag" on pothole "1"
    Given I step in my time machine and travel 10 days into the distant future
    And I press "Flag" on pothole "2"
    Then "Another Rd" should be before "Leeds Rd"
