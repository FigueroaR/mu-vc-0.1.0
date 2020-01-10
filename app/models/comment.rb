class Comment < ActiveRecord::Base 
  #associations
  belongs_to :event
  belongs_to :user
  validates :content, presence: :true
  
  def user_attributes=(user_attributes)
    #binding.pry
    self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  end
end