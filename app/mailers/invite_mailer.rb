class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invite_email.subject
  #
  def invite_email(invite, name)
    @url = event_url(invite.event_id)
    @name = name
    mail to: invite.recipient_email, subject: "Jazz-Brite: New Invitation From #{name}"
  end
end
