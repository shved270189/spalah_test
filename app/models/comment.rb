# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  text             :text
#  user_name        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string
#

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :user_name, :text, presence: true

  after_create :publish_comment

  # scope :order_created_at, ->(ord = :desc) { order("created_at #{ord.to_s}") }

  private

  def publish_comment
    RmqQueues.instance.publish_comment(self)
  end
end
