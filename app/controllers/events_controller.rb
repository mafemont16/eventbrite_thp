class EventsController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Your event has been created."
      render 'show'
    else
        render 'new'
      end
  end

  def edit
    @event = Event.find(params[:id])

  end

  def destroy
  @event = Event.find(params[:id]).delete
   redirect_to root_path
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.permit(:title, :location, :duration, :description, :price, :start_date, :admin_id)
 end

end
