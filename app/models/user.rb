# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#  team_id                :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :database_authenticatable

  module DatabaseAuthenticatable
    def password_digest(password)
      #BCrypt::Password.create(password)
      password
    end
  end  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :team_id, :password_confirmation, :remember_me
  has_many :trips, dependent: :destroy
  has_one :karma, dependent: :destroy
  has_one :level
  has_one :total, dependent: :destroy
  belongs_to :team
  # attr_accessible :title, :body
end
