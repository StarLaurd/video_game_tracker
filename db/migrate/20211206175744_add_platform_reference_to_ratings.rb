class AddPlatformReferenceToRatings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ratings, :platforms
    add_index :ratings, :platform_id
    change_column_null :ratings, :platform_id, false
  end
end
