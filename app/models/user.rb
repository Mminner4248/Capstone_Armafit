class User < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  attr_accessor :attribute1, :attribute2

  belongs_to :gym

  has_many :user_schedules
  has_many :schedules, :through => :user_schedules

  has_one :photos, :as => :imageable
  accepts_nested_attributes_for :photos

#Both methods used for autocomplete on the user create page. 
    def gym_name
        gym.try(:gym_name)
    end
  
    def gym_name=(name)
        self.gym = Gym.find_or_create_by(gym_name: name) if name.present?
    end
end
