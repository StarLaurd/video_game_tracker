json.extract! video_game, :id, :name, :release_date, :image, :publisher_id,
              :developer_id, :platform_id, :created_at, :updated_at
json.url video_game_url(video_game, format: :json)
