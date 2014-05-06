class AddNextPointsToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :next_level_points, :integer
  end
end
