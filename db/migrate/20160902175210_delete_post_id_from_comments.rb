class DeletePostIdFromComments < ActiveRecord::Migration[5.0]
  def up
    Comment.all.each do |comment|
      comment.commentable_id = comment.post_id
      comment.commentable_type = comment.post.class.to_s
      comment.save
    end
    remove_column :comments, :post_id
  end

  def down
    add_column :comments, :post_id, :integer
  end
end
