class User < ApplicationRecord
  #validations
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true 
  validates :email, presence: true, uniqueness: true

  #associations
  has_one_attached :photo
  has_many :rsvps
  has_many :events, through: :rsvps
  
  has_many :comments
  
end 