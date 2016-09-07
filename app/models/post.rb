# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ApplicationRecord
  has_many :comments, as: :commentable
  # has_many :order_comments, -> { order('created_at desc') } , class_name: Comment, as: :commentable
  belongs_to :user

  validates :title, :user_id, :body, presence: true

  def order_comments
    comments.order('created_at desc')
  end
end
