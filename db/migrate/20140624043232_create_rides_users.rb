class CreateRidesUsers < ActiveRecord::Migration
  def change
    create_table :rides_users, :id => false do |t|
    	t.references :rides
    	t.references :users
    end
  end
end
