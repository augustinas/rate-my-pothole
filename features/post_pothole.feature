Feature: User can post a pothole
  In order to inform the community
  As a driver
  I want to be able to post a pothole

  Background:
    Given I sign up

  Scenario: User posts a pothole
    Given I am on the homepage
    When I press "Report Pothole"
    And I fill in "street_name" with "Leeds Rd"
    And I press "Report"
    Then I should see "Pothole reported on Leeds Rd"
    And I see "Leeds Rd" within ".pothole-list__item"

  Scenario: User posts a another pothole
    Given I post a pothole on "Leeds Rd"
    And I post a pothole on "Another Rd"
    Then I should see "Pothole reported on Another Rd"
    And I see "Leeds Rd" within ".pothole-list"
    And I see "Another Rd" within ".pothole-list"

  Scenario: Non-registered users cannot post potholes
    When I press "Sign out"
    Then I should not see "Report Pothole"
    When I go to report potholes page
    Then I should not see "Report"

