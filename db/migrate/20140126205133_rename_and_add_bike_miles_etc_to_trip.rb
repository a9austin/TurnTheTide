class RenameAndAddBikeMilesEtcToTrip < ActiveRecord::Migration
  def up
    rename_column :trips, :miles_saved, :walk_miles
    add_column :trips, :bike_miles, :decimal
    add_column :trips, :train_miles, :decimal
    add_column :trips, :bus_miles, :decimal
  end

  def down
  end
end
