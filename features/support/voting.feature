Feature: Pothole Voting.
In order to establish the worst potholes.
As a User.
I'd like to vote on them.

  Background:
            Given I sign up
            Given I post a pothole

  Scenario: A pothole can be upvoted.
            Given I am on the homepage
            And I press "upvote"
            Then I should see "Votes : 1"
            And I should not see "upvote"
