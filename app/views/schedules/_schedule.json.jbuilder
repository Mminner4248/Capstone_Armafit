
json.id schedule.id
json.title schedule.title
json.description schedule.description
json.start schedule.start_time
json.end schedule.end_time

json.color schedule.color unless schedule.color.blank?

json.update_url schedule_path(schedule, method: :patch)
json.edit_url edit_schedule_path(schedule)
