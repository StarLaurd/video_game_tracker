class AddUserReferenceToStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :statuses, :users
    add_index :statuses, :user_id
    change_column_null :statuses, :user_id, false
  end
end
