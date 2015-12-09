class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
  # before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
    # @comments = Comment.where(post_id: params[:id].to_i)
    # @comments = @post.comments
    # @comments = @post.comments.order(created_at: :desc)#新しいコメントを上にする
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to post_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :category,
      :body,
      :image
      )
  end
end
