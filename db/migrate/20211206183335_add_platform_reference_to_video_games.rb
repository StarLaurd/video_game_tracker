class AddPlatformReferenceToVideoGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :video_games, :platforms
    add_index :video_games, :platform_id
    change_column_null :video_games, :platform_id, false
  end
end
