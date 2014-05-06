class KarmaPointsToDecimal < ActiveRecord::Migration
  def up
    change_column :karmas, :points, :decimal, {:scale => 4, :precision => 10}
  end

  def down
  end
end
