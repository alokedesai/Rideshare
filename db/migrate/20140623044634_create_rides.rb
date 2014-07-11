class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :airport
      t.string :flighttime
      t.string :datetime
      t.string :ridetime
      t.string :datetime

      t.timestamps
    end
  end
end
