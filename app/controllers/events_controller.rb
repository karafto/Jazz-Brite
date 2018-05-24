class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end

  def delete
  end
end
