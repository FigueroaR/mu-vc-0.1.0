class User < ActiveRecord::Base
  #validations
  has_secure_password
  validates :name, presence: true
  #validates :password, presence: true 
  validates :email, presence: true, uniqueness: true

  #associations
  has_many :rsvps
  has_many :events, through: :rsvps

  has_many :comments
  
end 