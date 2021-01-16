class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: params[:post_id])
    like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
