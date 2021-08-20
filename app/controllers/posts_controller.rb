class PostsController < ApplicationController

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
      render "new", alert: @post.errors.full_messages.first
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path, notice: "Successfully updated post"

    else
      render "edit", alert: @post.errors.full_messages.first
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Successfully deleted post"
  end

  private

  def post_params
    params.require(:post).permit(:title, :rating, :content, :date)
  end
end
