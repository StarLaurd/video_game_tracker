class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
