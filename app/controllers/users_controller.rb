class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def attend(event)
    active_rsvps.create(attended_event_id: event.id)
  end
end
