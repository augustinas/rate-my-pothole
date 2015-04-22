Feature: Pothole Flagging.
In order to establish the worst potholes.
As a User.
I'd like to flag on them.

  Background:
            Given I sign up
            Given I post a pothole

  Scenario: A pothole can be upvoted.
            Given I am on the homepage
            And I press "Flag"
            Then I should see "Votes : 1"
            And I should not see "Flag"

  Scenario: A pothole can not be unflagged before flagged.
            Given I am on the homepage
            Then I should not see "Unflagged"

  Scenario: I can flag on a pothole then downvote it
            Given I am on the homepage
            And I press "Flag"
            Then I should see "Votes : 1"
            And I should not see "Flag"
            And I press "Unflag"
            Then I should see "Votes : 0"
            And I should not see "Unflag"