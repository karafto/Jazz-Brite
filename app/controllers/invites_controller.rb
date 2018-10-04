class InvitesController < ApplicationController
  before_action :authenticate_user!

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id

    if @invite.save
      InviteMailer.invite_email(@invite, current_user.name).deliver_now
      flash[:success] = "Email invite sent."
      redirect_to event_url(@invite.event_id)
    else
      flash[:info] = "Please use a valid email address."
      redirect_to event_url(@invite.event_id)
    end
  end

  private
  
    def invite_params
      params.require(:invite).permit(:sender_id, :recipient_email, :event_id, :sent_at, :event_name)
    end
end
