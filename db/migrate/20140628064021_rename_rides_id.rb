class RenameRidesId < ActiveRecord::Migration
  def change
  	rename_column :rides_users, :rides_id, :ride_id
  end
end
