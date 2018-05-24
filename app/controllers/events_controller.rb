class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(post_params)
      if @event.save
        redirect_to events_path
      else
        render :new
      end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  def edit
  end
  def delete
  end

  private
    def post_params
      params.require(:event).permit(:description)
    end
end
