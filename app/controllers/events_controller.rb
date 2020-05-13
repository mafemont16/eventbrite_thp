class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    puts @event.title
    if @event.save
      flash[:success] = "Your event is now created."
      redirect_to event_path(@event.id)
    else
      messages = []
      if @event.errors.any?
        @event.errors.full_messages.each do |message|
          messages << message
        end
        flash[:error] = "See the following errors :#{messages.join(" ")}"
        render 'new'
      end
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
    params.require(:events).permit(:title, :location, :duration, :description, :price, :start_date, :admin_id)
  end
  
end
