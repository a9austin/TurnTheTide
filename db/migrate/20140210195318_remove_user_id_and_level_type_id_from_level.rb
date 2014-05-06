class RemoveUserIdAndLevelTypeIdFromLevel < ActiveRecord::Migration
  def up
    remove_column :levels, :user_id
    remove_column :levels, :level_type_id
  end

  def down
  end
end
