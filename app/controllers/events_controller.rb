class EventsController < ApplicationController
  def index 
    @events = Event.all
  end

  def new 
    @event = Event.new
  end 

  def create 
    #binding.pry
    @event = Event.create(event_params)
    redirect_to events_path
  end 

  def show 
    @event = Event.find_by(id: params[:id])
    #@users = @event.users.distinct 
    #rsvp
    @rsvp = @event.rsvps.build
    @rspvs = @event.rsvps.all 
    #comments
    @comment = @event.comments.build
    @comments = @event.comments.all
  end

  def edit 
    @event = Event.find_by(id: params[:id])
  end 

  def update 
    @event = Event.find_by(id: params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy 
    redirect_to events_path
  end

  private 

  def event_params
    params.require(:event).permit(:name, :city, :country, :start_time, :start_day, :content)
  end
end