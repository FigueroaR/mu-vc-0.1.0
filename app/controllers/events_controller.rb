class EventsController < ApplicationController
  def index 
    @event = Event.all
  end

  def new 
    @event = Event.new
  end 

  def create 
    binding.pry
    @event = Event.create(event_params)
    
  end 

  def show 
    @event = Event.find_by(id: params[:id])
  end

  def edit 
    @event = Event.find_by(id: params[:id])
  end 

  def update 
    @event = Event.find_by(id: params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  private 

  def event_params
    params.require(:event).permit(:name, :city, :country, :start_time, :start_day, :content)
  end
end