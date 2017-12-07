json.extract! user, :id, :password_digest, :gym_id, :image_id, :coach_auth, :first_name, :last_name, :email, :phone, :address, :city, :state, :country, :zip, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
