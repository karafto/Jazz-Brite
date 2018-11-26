# Jazz-Brite

**A jazz-themed web application inspired by Facebook Events.**

[See it live!](https://jazz-brite.herokuapp.com)

Today's jazz scene includes tons of exciting new artists, while numerous masters of the classic era continue to enrich and entertain. Jazz-Brite aims to provide a hub for sharing and exploring live happenings for what many call "America's premier art form".

<br />

![Jazz-Brite](app/assets/images/browsing.gif)

## Features

* Log in with Facebook credentials, or choose to create an account
* Create events and upload event pictures
* Browse events and view event details
* Instantly send email invitations, rapid-fire style
* Receive email invitations and follow a link to RSVP
* RSVP for events and get added to a list of attendees
* Discover which events are happening near your browsing location
* View event locations and directions in Google Maps
* Request emails with a link for password reset
* Edit your account and edit events you've created

## Technologies

* Jazz-Brite was built atop Ruby on Rails, a PostgreSQL database, and the Heroku platform.
* The Google Geocoding API looks up event addresses and sets the latitude and longitude.
* The IPinfo API locates users according to their IP address, thus allowing the app to highlight upcoming events in the user's local area.
* The Google Maps API combines event and user location data, giving users an external link to view directions on Google's site.
* The Facebook OAuth API enables users to login with their Facebook credentials and skip the hassle of creating a brand new account.
* To let users upload event pictures, Amazon Web Services (AWS) S3 Bucket stores images and serves them back to the application.
* After an email invitation is sent, SendGrid delivers the email on behalf of the site.
* Bootstrap was utilized for general styling and for making the interface responsive across a wide variety of desktop and tablet devices.
* jQuery and AJAX let users transfer data to the server and immediately view a modified layout—all without leaving an event page. Activated during RSVPs for events, updates to the list of attendees, and updates to the attendee count.

## Local Environment Setup

* Check that (a) Ruby, (b) Rails, and (c) Git are installed on your machine
* Clone the repo: `$ git clone https://github.com/karafto/jazz-brite.git`
* Install gems: `$ bundle`
* Migrate the database: `$ rails db:migrate RAILS_ENV=test`
* To run the app: `$ rails s`
* To run the full test suite: `$ rails t`

## Future Directions

* Commenting and liking on events
* Notifications for interaction with other users
* Internal invitations between signed-up users
* Ability to make events private