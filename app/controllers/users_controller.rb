class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @events = @user.events.order("date DESC")
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end

end
