# == Schema Information
#
# Table name: karmas
#
#  id         :integer          not null, primary key
#  points     :decimal(10, 4)
#  rank       :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level_id   :integer
#

require 'test_helper'

class KarmaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
