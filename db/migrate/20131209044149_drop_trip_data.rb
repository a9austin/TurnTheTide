class DropTripData < ActiveRecord::Migration
  def up
    drop_table :trip_data
  end

  def down
  end
end
