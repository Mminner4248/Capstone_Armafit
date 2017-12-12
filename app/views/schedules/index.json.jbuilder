json.array!(@schedules) do |schedule|
    json.extract! schedule, :id, :title, :description, :color
    json.start schedule.start_time
    json.end schedule.end_time

    json.update_url schedule_path(schedule, method: :patch)
    json.edit_url edit_schedule_path(schedule)
end
