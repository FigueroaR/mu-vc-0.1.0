class EventsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :edit]

  def index 
    #Scoped events <- methods are in event model, they need the current time as an argument
    @title = "Events "
    @user = User.find_by(id: params[:user_id])
    @past = Event.previous_events
    @coming = Event.upcoming_events
    #binding.pry
    if @user
      @title = "#{@user.name}'s Events"
      #Scoped events <--
      @coming = @user.events.upcoming_events
      @past = @user.events.previous_events
    end
  end
 
  def new 
    #if current_user = true
      @event = current_user.events.build
    #else
      #redirect_to events_path
    #end
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
    #binding.pry
    @event = Event.find_by(id: params[:id])
    if @event.admin == current_user.id
      render 'edit'
    else
      redirect_to events_path
    end
  end 

  def update 
    @event = Event.find_by(id: params[:id])
    if @event.admin == current_user.id
      @event.update(event_params)
      redirect_to event_path(@event)
    else  
      redirect_to events_path
    end
  end

  def destroy
    #binding.pry
    @event = Event.find_by(id: params[:id])
    if @event.admin == current_user.id
      @event.destroy 
      redirect_to events_path
    else
      redirect_to events_path
    end
  end
    
  private 

  def event_params
    params.require(:event).permit(:admin, :admin_name, :name, :city, :country, :start_time, :start_day, :content, :photo)
  end
end