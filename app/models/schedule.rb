class Schedule < ApplicationRecord
  validates :title, presence: true

  has_many :user_schedules

  has_many :users, :through => :user_schedules
end
