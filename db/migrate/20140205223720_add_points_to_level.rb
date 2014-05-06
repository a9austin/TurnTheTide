class AddPointsToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :current_level_points, :integer
  end
end
