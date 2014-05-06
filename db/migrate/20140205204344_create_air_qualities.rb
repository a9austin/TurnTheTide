class CreateAirQualities < ActiveRecord::Migration
  def change
    create_table :air_qualities do |t|
      t.string :category
      t.boolean :action
      t.integer :number

      t.timestamps
    end
  end
end
