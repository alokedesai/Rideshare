class ChangeRideTimeToTime < ActiveRecord::Migration
  def change
  	change_column :rides, :ridetime, :time
  end
end
