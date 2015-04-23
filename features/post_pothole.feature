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
    And I fill in "town_name" with "Liversedge"
    And I press "Report"
    Then I should see "Pothole reported on Leeds Rd, Liversedge"
    And I see "Leeds Rd" within ".pothole-list__item"
    And I see "Liversedge" within ".pothole-list__item"

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

  Scenario: Users cannot create a pothole without a town
    Given I am on the homepage
    When I press "Report Pothole"
    And I fill in "street_name" with "Leeds Liverpool Canal"
    And I fill in "town_name" with ""
    And I press "Report"
    Then I should see "Please provide a town"
    And I should be on report potholes page
    And I go to the homepage
    Then I should not see "Leeds Liverpool Canal"

  @javascript
  Scenario: See lat and long on pothole post
    Given I post a pothole on "Leeds Rd"
    When I wait 3 seconds
    Then I should see "53.7142843, -1.6805009"
