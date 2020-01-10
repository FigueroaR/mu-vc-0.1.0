class Event < ActiveRecord::Base 
  #accepts_nested_attributes_for :rsvps, reject_if: :all_blank

  #associations
  has_many :rsvps
  has_many :users, through: :rsvps

  has_many :comments

  def user_attributes=(user_attributes)
    #binding.pry
    self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  end
end