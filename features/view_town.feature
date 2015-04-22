Feature: Can view page of towns and click to view potholes
  In order to see the most relevant potholes
  As a time pressed and oft concerned citizen
  I want to only see potholes in my town

  Scenario: Can navigate from homepage to a list of towns
    Given the database is populated with potholes
    When I am on the homepage
    And I press "View by town"
    Then I should see "Liversedge"
    And I should see "Leeds"
    And I should see "Bournemouth"
    And I should see "London"