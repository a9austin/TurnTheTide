class AddLevelTypeIdToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :level_type_id, :integer
  end
end
