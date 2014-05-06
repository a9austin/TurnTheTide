class RemoveLevelFromKarma < ActiveRecord::Migration
  def up
    remove_column :karmas, :level
  end

  def down
  end
end
