# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  password   :string
#  email      :string
#

class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :email, :name, uniqueness: true
  validates :email, :name, :password, presence: true
  validates :password, length: { is: 6 }
  validates :password, confirmation: true
  validates :email, email: true

  enum role: [:user, :admin, :moderator]
end
