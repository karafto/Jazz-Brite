class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
      if @event.save
        flash[:notice] = "Event Created"
        redirect_to @event
      else
        render :new
      end
  end

  def index
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
    @event = Event.find(params[:id])
    if current_user.id == @event.user_id
      @event.destroy
      flash[:notice] = "Event Deleted"
      redirect_to current_user
    end
  end

  private
    def event_params
      params.require(:event).permit(:description, :title, :location, :date)
    end
end
