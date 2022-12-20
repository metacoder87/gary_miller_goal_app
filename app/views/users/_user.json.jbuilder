json.extract! user, :id, :username, :session_token, :password_digest, :cheer_count, :created_at, :updated_at
json.url user_url(user, format: :json)
