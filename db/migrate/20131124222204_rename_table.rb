class RenameTable < ActiveRecord::Migration
  def up
    rename_table :user_data, :trip_data
  end

  def down
    rename_table :trip_data, :user_data
  end
end
