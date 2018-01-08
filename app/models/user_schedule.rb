class UserSchedule < ApplicationRecord
  belongs_to :schedule
  belongs_to :user


  def self.search(term)
    if term
      where('user_notes LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
