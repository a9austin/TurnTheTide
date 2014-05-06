class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :category
      t.datetime :date
      t.decimal :miles_saved
      t.decimal :emissions_saved
      t.decimal :money_saved
      t.decimal :energy_saved
      t.integer :user_id

      t.timestamps
    end
  end
end
