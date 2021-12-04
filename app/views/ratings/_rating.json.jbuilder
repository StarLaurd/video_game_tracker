json.extract! rating, :id, :game_id, :user_id, :rating, :review, :created_at, :updated_at
json.url rating_url(rating, format: :json)
