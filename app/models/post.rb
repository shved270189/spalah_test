# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  has_many :comments
  has_many :order_comments, -> { order('created_at desc') } , class_name: Comment
  belongs_to :user

  validates :title, :user_id, :body, presence: true
end
