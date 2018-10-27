class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created successfully!"
      redirect_to @event
    else
      render :new
    end
  end

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
    if Rails.env.development? || Rails.env.test?
      user_location = [34.05223, -118.24368]
    else
      user_location = request.location.coordinates
    end

    @nearby_events = Event.upcoming.near(user_location, 100)
    @nearby_events.each do | event |
      event.distance_from_visitor = event.distance
    end
  end

  def show
    @event = Event.find(params[:id])
    if Rails.env.development? || Rails.env.test?
      @user_city = 'Los Angeles'
      @user_state = 'California'
      @user_postal_code = 90012
    else
      user_location = request.location
      @user_city = user_location.city
      @user_state = user_location.state
      @user_postal_code = user_location.postal_code
    end

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
        flash[:success] = "Event updated successfully."
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
      flash[:info] = "Your event has been successfully deleted."
      redirect_to current_user
    end
  end

  private
  
    def event_params
      params.require(:event).permit(:description, :title, :location, :date, :picture)
    end
end
