class Rsvp < ApplicationRecord 
  #associations
  belongs_to :user
  belongs_to :event

  #validation
  validates :event_id, presence: :true
  validates :user_id, presence: true
  #scope
  #scope :upcoming_rsvps, -> (time) {where( "start_day > ?", time)}
  #scope :previous_rsvps, -> (time) {where( "start_day < ?", time)}
  
  #def user_attributes=(user_attributes)
    #binding.pry
    #self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  #end
end