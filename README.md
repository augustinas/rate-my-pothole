[![Build Status](https://travis-ci.org/augustinas/rate-my-pothole.svg?branch=master)](https://travis-ci.org/augustinas/rate-my-pothole)

#Lab Week Plan#
Dan, Gus, Joe and Rob


##Functionalities##

- Sign Up
- Sign In
- Enter a pothole with a title, and town
- Ability to upvote a pothole once
- See what other users have voted
- See a ranked list of potholes in my town in a time range

- Display potholes on a map(Advanced)
- Enter a pothole location with a map (Advanced)
- Categorize Locations for multiple types(Advanced)
- Google / Facebook Sign-up (Advanced)
- Add Google Analytics to the page (Advanced)

(As a thought if we were looking for alternative theme Road Potholes could be an alternative to potholes, people can register their annoyance to their local road authority)

##User Stories##

As a user
In order to have a profile
I want to be able to sign up and sign in

As a signed in user
In order to recognise my favorite pothole
I want to be able to add if it is not already in place

As the client
I want users to be able to upvote without the page refreshing
So that I have an awesome UX

As a user that is not signed in
So I can find awesome potholes
I want to be able to view other peoples votes in a time period in my town

As a user
So I get an accurate account of users views
I want users to be able to make one vote per location a day


##MVP Roadmap##

MVP1 - User can log in, add a pothole in Liversedge. (Mon)
  - Add 'Hello World' X
  - sign up (username, email, password, password confirmation) (hash password) X

  - sign in (password authentication)
  - sign out

MVP2 - MVP1 + User can place a vote and the page doesn't refresh(Tue)

  - signed in user can post pothole (name, location, datetime(problems aticipated))
  - potholes diplayed on homepage
  - place a vote on the pothole that has been added

MVP3 - MVP2 + potholes are displayed in rank order(Tue)


MVP4a - MVP3 + Add functionality to show pothole votes on a map (Wed)

MVP4b - MVP5 + Display votes in a time period and by town (Wed)

Thurs - Advanced Features

Fri - Polish

-----------

#### TO DO:

* Bug where incorrect username and password warning persists after logging in
* Make an ajax call to vote and update page
* Label potholes on map
* Link to town on each pothole post
* Style buttons
* Footer stick to bottom


