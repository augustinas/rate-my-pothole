Feature: User can post a pothole
  In order to inform the community
  As a driver
  I want to be able to post a pothole

  Background:
    Given I sign up

  Scenario: User posts a pothole
    Given I am on the homepage
    When I press "Report Pothole"
    And I fill in "street-name" with "Leeds Rd"
    And I press "Report"
    Then I should see "Pothole reported on Leeds Rd"
    And I should see "Leeds Rd" within ".pothole-list__item"
