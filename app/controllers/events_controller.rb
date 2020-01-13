class EventsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :edit]
  def index 
    @events = Event.all
  end

  def new 
    @event = Event.new
  end 

  def create 
    binding.pry
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to events_path
    else 
      render 'new'
    end
  end 

  def show 
    @event = Event.find_by(id: params[:id])

    #rsvp
    @rsvp = @event.rsvps.build
    @attending = @event.rsvps.all
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
    params.require(:event).permit(:admin,:name, :city, :country, :start_time, :start_day, :content)
  end
end