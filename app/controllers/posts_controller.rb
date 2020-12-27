class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

    def index
      @posts = Post.all
      @post = Post.new
    end

    def show
      @post = Post.find_by(id: params[:id])
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
end
