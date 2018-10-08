class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    if params[:upcoming]
      @events = @user.upcoming_events.paginate(page: params[:page], per_page: 7)
    elsif params[:past]
      @events = @user.past_events.paginate(page: params[:page], per_page: 7)
    else
      @events = @user.events.order("date DESC").paginate(page: params[:page], per_page: 7)
    end
  end
end
