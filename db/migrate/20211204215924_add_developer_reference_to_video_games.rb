class AddDeveloperReferenceToVideoGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :video_games, :developers
    add_index :video_games, :developer_id
    change_column_null :video_games, :developer_id, false
  end
end
