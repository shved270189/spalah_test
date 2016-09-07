class CommentSerializer
  def initialize(comment)
    @comment = comment
  end

  def as_json
    {
      id: @comment.id,
      text: @comment.text,
      user_name: @comment.user_name,
      created_at: @comment.created_at.to_i
    }
  end
end
