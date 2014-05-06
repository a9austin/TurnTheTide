class DropLevelTypes < ActiveRecord::Migration
  def up
    drop_table :level_types
  end

  def down
  end
end
