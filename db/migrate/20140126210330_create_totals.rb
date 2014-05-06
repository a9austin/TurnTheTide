class CreateTotals < ActiveRecord::Migration
  def change
    create_table :totals do |t|
      t.integer :user_id
      t.integer :total_trips
      t.decimal :total_miles
      t.integer :total_walk_trips
      t.decimal :total_walk_miles
      t.integer :total_bike_trips
      t.decimal :total_bike_miles
      t.integer :total_bus_trips
      t.decimal :total_bus_miles
      t.integer :total_train_trips
      t.decimal :total_train_miles

      t.timestamps
    end
  end
end
