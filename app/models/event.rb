class Event < ApplicationRecord 
  
  #validations
  validates :name, presence: :true
  validates :city, presence: :true
  validates :country, presence: :true
  validates :content, presence: :true
  
  #associations
  has_many :rsvps
  has_many :users, through: :rsvps

  has_many :comments
  
  has_one_attached :photo

  #scopes 
  scope :upcoming_events, -> {where( "start_day > ?", Time.zone.now)} #Time.now
  scope :previous_events, -> {where( "start_day < ?", Time.zone.now)}
  scope :my_events, -> (id) {where( "admin == ?", id)} #current_user.id
  
  

  #def user_attributes=(user_attributes)
    #binding.pry
    #self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  #end

end