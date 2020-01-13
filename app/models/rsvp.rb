class Rsvp < ActiveRecord::Base 
  belongs_to :user
  belongs_to :event

  def user_attributes=(user_attributes)
    #binding.pry
    self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  end
end