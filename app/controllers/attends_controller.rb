class AttendsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:attended_event_id])
    current_user.attend(@event)
    redirect_to @event
  end

end
