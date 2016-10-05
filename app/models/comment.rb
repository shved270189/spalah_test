# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  text             :text(65535)
#  user_name        :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string(255)
#

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :user_name, :text, presence: true

  after_commit :publish_comment

  # scope :order_created_at, ->(ord = :desc) { order("created_at #{ord.to_s}") }

  private

  def publish_comment
    ChatJob.perform_later(self.id)
    # RmqJob
    # Pusher.trigger('comments', 'new', self.as_json)
  end
end
