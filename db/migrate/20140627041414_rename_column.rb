class RenameColumn < ActiveRecord::Migration
  def change
	change_column :rides, :datetime, :datetime 
    rename_column :rides, :datetime, :date
  end
end
