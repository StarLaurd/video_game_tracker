class CreatePlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :platforms do |t|
      t.integer :name

      t.timestamps
    end
  end
end
