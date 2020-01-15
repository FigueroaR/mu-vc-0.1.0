class RsvpsController < ApplicationController
  skip_before_action :verified_user, only: [:create]
  def create 
    #binding.pry
    rsvp = Rsvp.create(rsvp_params)
    redirect_to event_url(rsvp.event.id)
  end 

  private 

  def rsvp_params
    params.require(:rsvp).permit(:event_id, :user_id, :created_at)
  end
end 