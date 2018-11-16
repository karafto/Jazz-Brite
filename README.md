# Jazz-Brite

Jazz-themed events app inspired by Facebook Events

See it live: https://jazz-brite.herokuapp.com

## Features

Users can:

* Log in with Facebook, or choose to create an account
* Create events and upload event pictures
* Instantly send email invitations
* Receive email invitations and follow a link to RSVP
* RSVP for events and get added to a list of attendees
* View event locations and directions in Google Maps
* See which events are happening nearby
* Request emails with a link for password reset

## Technologies

* Ruby on Rails
* jQuery / AJAX
* Bootstrap
* AWS (S3)
* SendGrid
* Selected Gems:
  * Devise
  * OmniAuth
  * CarrierWave
  * Geocoder

## Local Environment Setup

Check that (a) Ruby, (b) Rails, and (c) Git are installed on your machine

Clone the repo: `$ git clone https://github.com/karafto/Jazz-Brite.git`

Install gems: `$ bundle`

Migrate the database: `$ rails db:migrate RAILS_ENV=test`

To run the app: `$ rails s`

To run the full test suite: `$ rails t`
