# == Schema Information
#
# Table name: air_qualities
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  action     :integer
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  discussion :string(255)
#  message    :string(255)
#

require 'test_helper'

class AirQualityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
