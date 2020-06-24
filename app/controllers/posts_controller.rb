class PostsController < ApplicationController
  # before_action :authenticate_user!
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.all
  end
  
  private
    def post_params
    params.require(:post).permit(:contain)
    end
end
