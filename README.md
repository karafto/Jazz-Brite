# Jazz-Brite

An Eventbrite clone, but for jazz. With Ruby on Rails.

See it live: https://jazz-brite.herokuapp.com

* [Devise](https://github.com/plataformatec/devise) gem for authentication and authorization

* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) gem for image uploading

* [Amazon S3](https://aws.amazon.com/s3/) for image storage in production

* Thorough testing with Minitest

## Local Environment Setup

Check that (a) Ruby, (b) Rails, and (c) Git are installed on your machine

Clone the repo: `$ git clone https://github.com/karafto/Jazz-Brite.git`

Install gems: `$ bundle`

Migrate the database: `$ rails db:migrate RAILS_ENV=test`

To run the app: `$ rails s`

To run the full test suite: `$ rails t`
