class Gym < ApplicationRecord
    belongs_to :user, :foreign_key => 'user_id'
    belongs_to :schedule, :foreign_key => 'schedule_id'
end
