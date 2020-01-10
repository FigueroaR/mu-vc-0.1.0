class Comment < ActiveRecord::Base 
  #associations
  belongs_to :event
  belongs_to :user

  def user_attributes=(user_attributes)
    self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  end
end