class ApplicationMailer < ActionMailer::Base
  default from: 'invites@jazz-brite.herokuapp.com'
  layout 'mailer'
end
