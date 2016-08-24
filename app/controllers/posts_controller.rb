class PostsController < ApplicationController
  before_action :authenticate!, except: [:index, :show]
  before_action :authenticate_owner!, only: [:destroy]

  def index
    @posts = Post.all
    render :index
  end

  def two
    @posts = Post.order('created_at desc').limit(2)
    render :index
  end

  def red
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.order_comments
    render :show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    # @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
