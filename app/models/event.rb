class Event < ApplicationRecord 
  #accepts_nested_attributes_for :rsvps, reject_if: :all_blank

  validates :name, presence: :true
  validates :city, presence: :true
  validates :country, presence: :true
  validates :content, presence: :true
  #associations
  has_many :rsvps
  has_many :users, through: :rsvps

  has_many :comments

  def user_attributes=(user_attributes)
    #binding.pry
    self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  end

end