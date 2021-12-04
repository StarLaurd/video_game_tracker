class AddUserReferenceToRatings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ratings, :users
    add_index :ratings, :user_id
    change_column_null :ratings, :user_id, false
  end
end
