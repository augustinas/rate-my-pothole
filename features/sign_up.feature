Feature: As a user
         In order to have a profile
         I would like to sign up

  Scenario: Can sign up
            Given I am on the homepage
            Then I should see "Hello World"
            When I press "Sign up"
            And I fill in "username" with "citizen1"
            And I fill in "email" with "angry@citizen.com"
            And I fill in "password" with "ra88it"
            And I fill in "password_confirmation" with "ra88bit"
            And I press "Sign up"
            Then I should see "Welcome, citizen1!"
            And I am on the homepage
