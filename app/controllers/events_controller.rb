class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
      if @event.save
        flash[:success] = "Event Created"
        redirect_to @event
      else
        render :new
      end
  end

  def index
  end

  def show
    @event = Event.find(params[:id])
    if Event.past.include?(@event)
      flash[:info] = "This event has ended."
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if authorized?(@event) && Event.upcoming.include?(@event) 
      @event.update(event_params)
      flash[:success] = "Event Updated"
      redirect_to @event
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if authorized?(@event)
      @event.destroy
      flash[:success] = "Event Deleted"
      redirect_to current_user
    end
  end

  private
    def event_params
      params.require(:event).permit(:description, :title, :location, :date)
    end
end
