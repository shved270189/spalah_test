# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  email           :string
#  role            :integer          default("user")
#

class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :email, :name, uniqueness: true
  validates :email, :name, presence: true
  validates :password, presence: true, if: lambda{ |object| object.password.present? }
  validates :password, length: { is: 6 }, if: lambda{ |object| object.password.present? }
  validates :password, confirmation: true, if: lambda{ |object| object.password.present? && object.password_confirmation.present? }
  validates :email, email: true

  enum role: [:user, :admin, :moderator]
end
