class UpdateDecimalValueRounding < ActiveRecord::Migration
  def up
    change_column :trips, :walk_miles, :decimal, {:scale => 4, :precision => 10}
    change_column :trips, :bike_miles, :decimal, {:scale => 4, :precision => 10}
    change_column :trips, :bus_miles, :decimal, {:scale => 4, :precision => 10}
    change_column :trips, :train_miles, :decimal, {:scale => 4, :precision => 10}
    change_column :totals, :total_miles, :decimal, {:scale => 4, :precision => 10}
    change_column :totals, :total_walk_miles, :decimal, {:scale => 4, :precision => 10}
    change_column :totals, :total_bus_miles, :decimal, {:sccale => 4, :precision => 10}
    change_column :totals, :total_bike_miles, :decimal, {:scale => 4, :precision => 10}
    change_column :totals, :total_train_miles, :decimal, {:scale => 4, :precision => 10}
  end

  def down
  end
end
