class Like
  include Mongoid::Document

  field :post_id, type: Integer
  field :user_id, type: Integer

  validates :post_id, :user_id, presence: true
end
