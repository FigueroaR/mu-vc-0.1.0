class Comment < ActiveRecord::Base 
  #associations
  belongs_to :event
  belongs_to :user

end