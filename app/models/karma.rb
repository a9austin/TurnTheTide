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

class Karma < ActiveRecord::Base
  attr_accessible :points, :rank, :user_id, :level_id
  belongs_to :user 
  has_one :level
end
