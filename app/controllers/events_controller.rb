class EventsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :edit]
  def index 
    #binding.pry
    #if params[:user_id] == current_user.id 
      #redirect_to myindex_path
    #else
      #Scoped events <- methods are in event model, they need the current time as an argument
      @past = Event.previous_events
      @coming = Event.upcoming_events
    #end

  end
  

  def myindex
    #Scoped events <- methods are in event model, they need the current_user as an argument
    @myupcoming = Event.my_events(current_user).upcoming_events
    @mypast = Event.my_events(current_user).previous_events
    render "myindex"
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