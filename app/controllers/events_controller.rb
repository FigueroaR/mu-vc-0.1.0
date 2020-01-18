class EventsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :edit]
  def index 
    #binding.pry
    #Scoped events <- methods are in event model, they need the current time as an argument
    @past = Event.previous_events(Time.zone.now)
    @coming = Event.upcoming_events(Time.zone.now)
  end

  def myindex
    #Scoped events <- methods are in event model, they need the current_user as an argument
    @my = Event.my_events(current_user)
    render "myindex"
  end

  def new 
    @event = current_user.events.build
  end 

  def create 
    #binding.pry
    @event = current_user.events.build(event_params)
    if @event.valid?
      @event.save
      redirect_to events_path
    else 
      render 'new'
    end
  end 

  def show 
    #binding.pry

    @event = Event.find_by(id: params[:id])
    #rsvp
    @rsvp = @event.rsvps.build
    @attending = @event.rsvps.all
    #comments
    @comment = @event.comments.build
    @comments = @event.comments.all
    
    if @event.admin == current_user.id
      render 'adminshow'
    else 
      render 'show'
    end 
  end

  def edit 
    @event = current_user.events.find_by(id: params[:id])
    if @event.admin == current_user.id
      render 'edit'
    else
      redirect_to events_path
    end
  end 

  def update 
    
    @event = current_user.events.find_by(id: params[:id])
    @event.update(event_params)
    binding.pry

    redirect_to event_path(@event)
  end

  def destroy
    @event = current_user.events.find_by(id: params[:id])
    if @event.admin == current_user.id
      @event.destroy 
    else
      redirect_to events_path
    end
  end
    

  private 

  def event_params
    params.require(:event).permit(:admin, :admin_name, :name, :city, :country, :start_time, :start_day, :content, :photo)
  end
end