class RemoveUnecessarySavedColumnsFromTrip < ActiveRecord::Migration
  def up
    remove_column :trips, :emissions_saved
    remove_column :trips, :money_saved
    remove_column :trips, :energy_saved
  end

  def down
  end
end
