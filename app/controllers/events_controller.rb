class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event Created!"
      redirect_to @event
    else
      render :new
    end
  end

  def index
    if params[:past]
      @events = Event.past.paginate(page: params[:page], per_page: 7)
    else
      @events = Event.upcoming.paginate(page: params[:page], per_page: 7)
    end
  end

  def show
    @event = Event.find(params[:id])
    if @event.date < Time.zone.now
      flash.now[:info] = "This event has ended."
    else
      @invite = Invite.new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if authorized?(@event) 
      if @event.update(event_params)
        flash[:success] = "Event Updated"
        redirect_to @event
      else
        render :edit
      end
    else
      redirect_to events_path
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if authorized?(@event)
      @event.destroy
      flash[:info] = "Event Deleted"
      redirect_to current_user
    end
  end

  private
  
    def event_params
      params.require(:event).permit(:description, :title, :location, :date, :picture)
    end
end
