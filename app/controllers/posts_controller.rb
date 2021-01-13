class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

    def index
      @posts = Post.all
      @post = Post.new
    end

    def show
      @post = Post.find_by(id: params[:id])
      @like = Like.new
      @likes_count = Like.where(post_id: @post.id).count
      @comment = Comment.new
      @comments = @post.comments
      @comments_count = Comment.where(post_id: @post.id).count
    end
    
    def new
      @post = Post.new
    end

    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:notice] = "投稿完了！"
        redirect_to posts_path
      end
    end

    def edit
      @post = Post.find_by(id: params[:id])
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to posts_path
    end

    private

    def post_params
      params.require(:post).permit(:content, :title, :picture)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      unless @post
        redirect_to root_path
      end
    end
end
