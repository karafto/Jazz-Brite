# Jazz-Brite

**A jazz-themed web application inspired by Facebook Events.**

[See it live!](https://jazz-brite.herokuapp.com)

Today's jazz scene includes tons of exciting new artists, while numerous masters of the classic era continue to enrich and entertain. Jazz-Brite aims to provide a hub for sharing and exploring live happenings for what many call "America's premier art form".

<br />

![Jazz-Brite](app/assets/images/browsing_2.gif)

## Features

* Log in with Facebook credentials, or choose to create an account
* Create and edit events, and upload event pictures
* Send email invitations with a single click
* Receive email invitations and follow a link to RSVP
* Discover which events are happening near your browsing location
* View event locations and directions in Google Maps
* Request emails with a link for password reset

## Technologies

* Jazz-Brite was built atop Ruby on Rails, a PostgreSQL database, and the Heroku platform.
* Looks up event addresses and sets latitude and longitude via the Google Geocoding API.
* Locates users according to their IP address by using the IPinfo API, allowing the app to highlight upcoming events in the user's local area.
* Combines event and user location data through the Google Maps API, giving users an external link to view directions on Google's site.
* Enables users to login with their Facebook credentials by connecting to the Facebook OAuth API, thus skipping the hassle of creating a brand new account.
* Integrates Amazon Web Services (AWS) S3 Bucket to store uploaded images and serve them back to the application.
* When an email invitation is sent, accomplishes delivery with assistance from SendGrid.
* When users RSVP for events, dynamically modifies the layout by activating jQuery and AJAX.
* The UI is sprinkled with Bootstrap for a clean design that's responsive across a wide variety of desktop and tablet devices.

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