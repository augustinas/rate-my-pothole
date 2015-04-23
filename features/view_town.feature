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

  Scenario: Can follow link to see potholes in Liversedge
    Given the database is populated with potholes
    When I am on the homepage
    And I press "View by town"
    And I follow "Liversedge"
    Then I should see "Leeds Rd, Liversedge"
    And I should not see "Bournemouth"
    And I should not see "main ave"