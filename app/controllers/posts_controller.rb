class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
  before_action :correct_user,   only: :destroy
  
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
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def destroy
    @post.destroy!
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private
    def post_params
      params.require(:post).permit(:contain,:textcomment,:fab)
    end

    def correct_user
      @post = Post.find_by(id: params[:id])
      redirect_to root_url if @post&.user != current_user
    end
end

