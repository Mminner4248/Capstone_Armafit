json.extract! schedule, :id, :gym_id, :title, :description, :start_time, :end_time, :color, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
