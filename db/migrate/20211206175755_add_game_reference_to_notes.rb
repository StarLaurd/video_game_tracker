class AddGameReferenceToNotes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :notes, :video_games, column: :game_id
    add_index :notes, :game_id
    change_column_null :notes, :game_id, false
  end
end
