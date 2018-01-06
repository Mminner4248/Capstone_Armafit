class ExerciseInfo < ApplicationRecord
    def self.search(search)
        where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
end