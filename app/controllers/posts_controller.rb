class PostsController < ApplicationController
  authenticate_user!
  
  def new
    @post = Post.new
    @post.photos.build
  end
  
  def create
binding.pry
    @post = current_user.posts.build(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  private
    def post_params
    params.require(:post).permit(:contain, photos_attributes: [:image])
    end
end
