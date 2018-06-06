class AttendsController < ApplicationController
  before_action :authenticate_user!

  def create
    if Event.upcoming.include?(@event)
      @event = Event.find(params[:attended_event_id])
      current_user.attend(@event)
      flash[:success] = "Nice! You're going to this event."
      redirect_to @event
    end
  end

  def destroy
    if Event.upcoming.include?(@event)
      @event = Event.find(params[:attended_event_id])
      current_user.unattend(@event)
      flash[:info] = "You're no longer going to this event."
      redirect_to @event
    end
  end

end
