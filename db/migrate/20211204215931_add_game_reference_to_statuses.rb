class AddGameReferenceToStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :statuses, :video_games, column: :game_id
    add_index :statuses, :game_id
    change_column_null :statuses, :game_id, false
  end
end
