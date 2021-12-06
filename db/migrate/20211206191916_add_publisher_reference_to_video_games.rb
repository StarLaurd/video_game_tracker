class AddPublisherReferenceToVideoGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :video_games, :publishers
    add_index :video_games, :publisher_id
    change_column_null :video_games, :publisher_id, false
  end
end
