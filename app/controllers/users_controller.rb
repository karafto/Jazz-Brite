class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if request.fullpath.include?('upcoming=true')
      @events = @user.upcoming_events.paginate(page: params[:page], per_page: 7)
    elsif request.fullpath.include?('past=true')
      @events = @user.past_events.paginate(page: params[:page], per_page: 7)
    else
      @events = @user.events.order("date DESC").paginate(page: params[:page], per_page: 7)
    end
  end
end
