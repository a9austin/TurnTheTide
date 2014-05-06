class AddCarMilesToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :car_miles, :Integer
  end
end
