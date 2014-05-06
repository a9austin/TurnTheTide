class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
      t.decimal :bike
      t.decimal :walk
      t.decimal :bus
      t.decimal :trax

      t.timestamps
    end
  end
end
