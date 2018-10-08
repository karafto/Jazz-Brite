class AttendsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:attended_event_id])
    if @event.date >= Time.zone.now
      current_user.attend(@event)
      respond_to do |format|
        format.html { redirect_to @event }
        format.js
      end
    end
  end

  def destroy
    @event = Attend.find(params[:id]).attended_event
    if @event.date >= Time.zone.now
      current_user.unattend(@event)
      respond_to do |format|
        format.html { redirect_to @event }
        format.js
      end
    end
  end
end
