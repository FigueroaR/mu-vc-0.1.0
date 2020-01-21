class Comment < ApplicationRecord
  #associations
  belongs_to :event
  belongs_to :user

  #validation
  validates :content, presence: :true
  validates :event_id, presence: :true
  validates :user_id, presence: true
  
  #def user_attributes=(user_attributes)
    #binding.pry
    #self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  #end
end