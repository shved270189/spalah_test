# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string
#  likes              :text
#

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  serialize :likes, Array

  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :comments, as: :commentable
  # has_many :order_comments, -> { order('created_at desc') } , class_name: Comment, as: :commentable
  belongs_to :user

  validates :title, :user_id, :body, presence: true
  # validates :slug, uniquenes: true

  before_save do
    likes.uniq!
  end

  # before_create do
  #   slug_candidate = title.downcase.gsub(' ', '-') # My First Post => my-first-post
  #   if Post.exists?(slug: slug_candidate)
  #     slug_candidate = "#{slug_candidate}-#{id}"
  #   end
  #   slug = slug_candidate
  # end

  def order_comments
    comments.order('created_at desc')
  end

  def likes_count
    likes.count
  end

  def liked_by?(user)
    likes.include? user.id
  end

  def like_by(user)
    likes << user.id
  end

  def like_by!(user)
    like_by(user)
    save
  end

  def unlike_by(user)
    likes.delete(user.id)
  end

  def unlike_by!(user)
    unlike_by(user)
    save
  end
end
