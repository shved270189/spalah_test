# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :text
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#

class Comment < ApplicationRecord
  belongs_to :post

  validates :user_name, :text, presence: true

  # scope :order_created_at, ->(ord = :desc) { order("created_at #{ord.to_s}") }
end
