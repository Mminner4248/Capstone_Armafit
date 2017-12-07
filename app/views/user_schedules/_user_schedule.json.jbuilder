json.extract! user_schedule, :id, :schedule_id, :user_id, :user_notes, :attended, :created_at, :updated_at
json.url user_schedule_url(user_schedule, format: :json)
