class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @post.comments.order("created_at ASC")

    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented the hell out of that post!"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.delete
      flash[:notice] = 'Comment deleted.'
      redirect_to root_path
    else
      flash[:warning] = "That doesn't belong to you!"
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
