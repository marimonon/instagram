class CommentsController < ApplicationController
  before_action :correct_user,   only: :destroy
  
  def create
    comment=Comment.new(comment_params)
    comment.user_id = current_user.id
   if comment.save!
      redirect_back(fallback_location: root_path)
   else
      flash[:alert] = "コメントを入力してください"
      redirect_back(fallback_location: root_path)
   end
  end
  
  def destroy
    @comment=Comment.find_by(id: params[:id])
    @post = @comment.post
    @comment.destroy!
    redirect_to post_path(@post)
    flash[:success] = "投稿を削除しました"
  end

private
    def comment_params
      params.require(:comment).permit(:textcomment, :post_id, :user_id)
    end
 
    def correct_user
      post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if post.nil?
    end
end

