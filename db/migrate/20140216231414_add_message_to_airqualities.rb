class AddMessageToAirqualities < ActiveRecord::Migration
  def change
    add_column :air_qualities, :message, :string
  end
end
