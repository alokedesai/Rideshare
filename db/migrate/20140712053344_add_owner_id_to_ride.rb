class AddOwnerIdToRide < ActiveRecord::Migration
  def change
  	add_column :rides, :owner_id, :integer, references: :users
  end
end
