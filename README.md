# Jazz-Brite

**A jazz-themed events app inspired by Facebook Events.**

See it live: https://jazz-brite.herokuapp.com

Try it out as a Demo user!

## Features

Users can:

* Log in with Facebook, or choose to create an account
* Create events and upload event pictures
* Browse events and view event details
* Instantly send email invitations
* Receive email invitations and follow a link to RSVP
* RSVP for events and get added to a list of attendees
* Discover which events are happening nearby
* View event locations and directions in Google Maps
* Request emails with a link for password reset

## Technologies

* Ruby on Rails
* PostgreSQL
* Heroku
* jQuery / AJAX
* Bootstrap
* AWS (S3)
* SendGrid
* Gems include:
  * Devise
  * OmniAuth
  * CarrierWave
  * Geocoder
  * Font-Awesome Sass

## Local Environment Setup

Check that (a) Ruby, (b) Rails, and (c) Git are installed on your machine

Clone the repo: `$ git clone https://github.com/karafto/jazz-brite.git`

Install gems: `$ bundle`

Migrate the database: `$ rails db:migrate RAILS_ENV=test`

To run the app: `$ rails s`

To run the full test suite: `$ rails t`
