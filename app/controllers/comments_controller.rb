class CommentsController < ApplicationController
  def create
    @comment=Comment.new(comment_params)
    @post=@comment
   if @comment.present?
    @post.save
   else
      flash[:alert] = "コメントを入力してください"
   end
  end
  
  def destroy
    @comment.detroy
  end

private
  def comment_params
    params.require(:comment).permit(:post_id, :comment)
  end
end