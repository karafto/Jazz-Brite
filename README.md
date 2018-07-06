# Jazz-Brite

An Eventbrite clone, but for jazz. With Ruby on Rails.

See it live: https://jazz-brite.herokuapp.com

* [Devise](https://github.com/plataformatec/devise) gem for authentication and authorization

* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) gem for image uploading

* [Amazon S3](https://aws.amazon.com/s3/) for image storage in production

* Thorough testing with Minitest

## Local Deployment and Testing

Check that (a) Ruby, (b) Rails, and (c) Git are installed on your machine

Clone the repo: `$ git clone https://github.com/karafto/Jazz-Brite.git`

Install gems: `$ bundle`

Create and migrate the database:

`$ rails db:create RAILS_ENV=test`

`$ rails db:migrate`

To run the app: `$ rails s`

To run the full test suite: `$ rails t`
