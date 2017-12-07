class User < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :email

  has_many :user_schedules
    
  has_many :images, as: :imageable
end
