class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(author: current_user, title: params[:event][:title],
                       start_date: params[:event][:start_date],
                       duration: params[:event][:duration],
                       description: params[:event][:description],
                       price: params[:event][:price],
                       location: params[:event][:location]
                       )

      if @event.save
        flash[:success] = "The event was successfuly created"
        redirect_to events_path(@event.id)
      else
        flash[:error] = "The event could not be created! Please check everything again"
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
end
