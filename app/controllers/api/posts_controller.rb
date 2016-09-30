module Api
  class PostsController < ApplicationController
    respond_to :json

    before_action :authenticate!

    load_and_authorize_resource

    def index
      @q = Post.search(params[:q])
      @posts = @q.result(distinct: true).includes(:comments, :user).order('created_at desc').page(params[:page])

      render :index
    end

    def show
      @comments = @post.order_comments
      render :show
    end

    def create
      @post.save
      redirect_to post_path(@post)
    end

    def update
      @post.update(post_params)
      redirect_to post_path(@post)
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    def like
      @post.like_by!(current_user)
      render partial: 'likes_post', locals: { post: @post }
    end

    def unlike
      @post.unlike_by!(current_user)
      render partial: 'likes_post', locals: { post: @post }
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
  end
end
