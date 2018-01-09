class UserSchedule < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

#used for search functionality on WOD Tracker page. See User Schedule Controller for more info. 
  def self.search(term)
    if term
      where('user_notes LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
