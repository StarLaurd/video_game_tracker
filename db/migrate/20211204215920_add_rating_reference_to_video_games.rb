class AddRatingReferenceToVideoGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :video_games, :ratings
    add_index :video_games, :rating_id
    change_column_null :video_games, :rating_id, false
  end
end
