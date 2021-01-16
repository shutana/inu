class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_back(fallback_location: post_path(@post))
  end
  
  def destroy
    @comment = Comment.find_by(user_id: current_user.id, post_id: params[:post_id])
    @comment.destroy
    redirect_back(fallback_location: post_path(@post))
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
