class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]


  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:success] = "Post updated hombre"
      redirect_to @post
    else
      flash[:alert] = "Something is wrong with your form!"
      render :new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Problem solved!  Post deleted.'
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def owned_post
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end

end
