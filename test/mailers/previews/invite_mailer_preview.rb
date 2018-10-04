# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invite_mailer/invite_email
  def invite_email
    invite = Invite.last
    InviteMailer.invite_email(invite)
  end

end
