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

  Scenario: A pothole can be downvoted.
            Given I am on the homepage
            And I press "downvote"
            Then I should see "Votes : -1"
            And I should not see "downvote"

  Scenario: I can upvote on a pothole then downvote it
            Given I am on the homepage
            And I press "upvote"
            Then I should see "Votes : 1"
            And I should not see "upvote"
            And I press "downvote"
            Then I should see "Votes : 0"
            And I should not see "downvote"

  Scenario: Potholes displayed by vote order
            Given I am on the homepage
            And I post a pothole on "Another Rd"
            And I press "upvote" on pothole "1"
            Then "Leeds Rd" should be before "Another Rd"
