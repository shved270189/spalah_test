# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  email           :string(255)
#  role            :integer          default("user")
#  type            :string(255)
#  resume          :string(255)
#  provider        :string(255)
#  picture         :text(65535)
#  provider_id     :string(255)
#  auth_token      :string(255)
#

class User < ApplicationRecord
  # has_secure_password
  mount_uploader :resume, ResumeUploader

  has_many :posts
  has_many :sessions

  has_one :avatar, as: :imagable, class_name: Image

  validates :email, :name, uniqueness: true
  validates :email, :name, presence: true
  # validates :password, presence: true, if: lambda{ |object| object.password.present? }
  # validates :password, length: { is: 6 }, if: lambda{ |object| object.password.present? }
  # validates :password, confirmation: true, if: lambda{ |object| object.password.present? && object.password_confirmation.present? }
  validates :email, email: true

  enum role: [:user, :admin, :moderator]

  delegate :file, to: :avatar, prefix: true

  after_create do
    UserMailer.welcome(self).deliver_later
  end

  def generate_session_token!
    sessions.create.token
  end
end
