class ChangeRidesUsersNames < ActiveRecord::Migration
  def change
  	rename_column :rides_users, :rides_id, :rides_id
  	rename_column :rides_users, :users_id, :user_id
  end
end
