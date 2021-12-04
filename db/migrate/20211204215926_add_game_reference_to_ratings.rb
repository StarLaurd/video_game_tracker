class AddGameReferenceToRatings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ratings, :video_games, column: :game_id
    add_index :ratings, :game_id
    change_column_null :ratings, :game_id, false
  end
end
