class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    if params[:upcoming]
      @events = @user.upcoming_events
    elsif params[:past]
      @events = @user.past_events
    else
      @events = @user.events.order("date DESC")
    end
  end
end
