# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  date        :datetime
#  walk_miles  :decimal(10, 4)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bike_miles  :decimal(10, 4)
#  train_miles :decimal(10, 4)
#  bus_miles   :decimal(10, 4)
#  car_miles   :integer
#

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
