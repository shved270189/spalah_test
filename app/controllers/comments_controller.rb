class CommentsController < ApplicationController
  before_action :set_post

  # def index
  #   @comments = @post.comments
  # end

  # def new
  #   @comment = @post.comments.new
  # end

  # def show
  #
  # end

  def create
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_name)
  end
end
