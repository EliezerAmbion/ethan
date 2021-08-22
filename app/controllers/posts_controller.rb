class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: "Successfully created a post"

    else
      flash[:alert] = @post.errors.full_messages.first
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "Successfully updated post"

    else
      flash[:alert] = @post.errors.full_messages.first
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Successfully deleted post"
  end

  private

  def post_params
    params.require(:post).permit(:title, :rating, :content, :date)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
