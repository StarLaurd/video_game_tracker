json.extract! status, :id, :game_id, :user_id, :status, :created_at, :updated_at
json.url status_url(status, format: :json)
