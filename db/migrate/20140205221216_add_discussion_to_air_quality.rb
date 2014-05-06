class AddDiscussionToAirQuality < ActiveRecord::Migration
  def change
    add_column :air_qualities, :discussion, :string
  end
end
