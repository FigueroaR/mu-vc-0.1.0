class RsvpsController 

  def new 
    @rsvp = Rsvp.new
  end 

  def create 
    binding.pry
    rsvp = Comment.create(rsvp_params)
    redirect_to rsvp.event
  end 

  private 

  def rsvp_params
    params.require(:rsvp).permit( :event_id, :user_id, user_attributes:[:name])
  end
end 