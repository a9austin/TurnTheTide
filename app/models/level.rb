# == Schema Information
#
# Table name: levels
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  current_level_points :integer
#  next_level_points    :integer
#  label                :string(255)
#  filename             :string(255)
#

class Level < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :label, :filename
  has_many :karma
end
