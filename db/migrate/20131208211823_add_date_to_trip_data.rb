class AddDateToTripData < ActiveRecord::Migration
  def change
    add_column :trip_data, :date, :datetime
  end
end
