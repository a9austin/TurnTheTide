class RemoveCategoryFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :category
  end

  def down
  end
end
