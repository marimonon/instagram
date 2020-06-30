class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def index
    @users=User.all
  end
  
  private
    def user_params
       params.require(:user).permit(:name, :email, :password)
    end
end
