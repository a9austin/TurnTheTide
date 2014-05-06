class RemoveLevelIdFromUsers < ActiveRecord::Migration
  def up
    remove_columns :users, :level_id
    add_column :karmas, :level_id, :integer
  end

  def down
  end
end
