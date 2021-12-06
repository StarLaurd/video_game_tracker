class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :rating
      t.text :review
      t.integer :platform_id

      t.timestamps
    end
  end
end
