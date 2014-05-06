# == Schema Information
#
# Table name: totals
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  total_trips       :integer
#  total_miles       :decimal(10, 4)
#  total_walk_trips  :integer
#  total_walk_miles  :decimal(10, 4)
#  total_bike_trips  :integer
#  total_bike_miles  :decimal(10, 4)
#  total_bus_trips   :integer
#  total_bus_miles   :integer
#  total_train_trips :integer
#  total_train_miles :decimal(10, 4)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  total_car_miles   :integer
#  total_car_trips   :integer
#

require 'test_helper'

class TotalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
