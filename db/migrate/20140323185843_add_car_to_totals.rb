class AddCarToTotals < ActiveRecord::Migration
  def change
    add_column :totals, :total_car_miles, :Integer
    add_column :totals, :total_car_trips, :Integer
  end
end
