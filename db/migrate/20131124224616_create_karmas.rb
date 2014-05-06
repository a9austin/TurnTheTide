class CreateKarmas < ActiveRecord::Migration
  def change
    create_table :karmas do |t|
      t.integer :points
      t.integer :rank
      t.string :level
      t.integer :user_id

      t.timestamps
    end
  end
end
