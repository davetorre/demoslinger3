class AddIndexToUsersScUserId < ActiveRecord::Migration
  def change
    add_index :users, :sc_user_id, unique: true
  end
end
