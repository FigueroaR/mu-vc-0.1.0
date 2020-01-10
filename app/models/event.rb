class Event < ActiveRecord::Base 
  #accepts_nested_attributes_for :rsvps, reject_if: :all_blank

  #associations
  has_many :rsvps
  has_many :users, through: :rsvps

  has_many :comments
end