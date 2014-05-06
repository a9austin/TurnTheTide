# == Schema Information
#
# Table name: feeds
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  message    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feed < ActiveRecord::Base
  attr_accessible :message, :username
end
