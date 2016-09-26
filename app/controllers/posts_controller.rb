class PostsController < ApplicationController
  before_action :authenticate!, except: [:index, :show]
  before_action :authenticate_owner!, only: [:destroy]
  before_action :set_post, except: [:index, :two, :new, :create]

  def index
    @q = Post.search(params[:q])
    @posts = @q.result(distinct: true).order('created_at desc').paginate(page: params[:page] || 1, per_page: params[:per_page] || 20)
    render :index
  end

  def two
    @posts = Post.order('created_at desc').limit(2)
    render :index
  end

  def red
  end

  def show
    @comments = @post.order_comments
    render :show
  end

  def new
    @post = Post.new
  end

  def create
    SleeperJob.perform_later
    @post = current_user.posts.new(post_params)
    @post.save
    # @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def edit
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

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
