class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @post.order_comments

    respond_to do |format|
      format.html { render :index, layout: !request.xhr? }
      format.json { render json: @comments }
    end
  end

  # def new
  #   @comment = @post.comments.new
  # end

  # def show
  #
  # end

  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.json { render json: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
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
