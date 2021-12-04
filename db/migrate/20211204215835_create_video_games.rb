class CreateVideoGames < ActiveRecord::Migration[6.0]
  def change
    create_table :video_games do |t|
      t.string :name
      t.date :release_date
      t.integer :rating_id
      t.string :image
      t.integer :publisher_id
      t.integer :developer_id

      t.timestamps
    end
  end
end
