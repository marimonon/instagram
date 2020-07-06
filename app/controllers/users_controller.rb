class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def index
    @users=User.all
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
    def user_params
       params.require(:user).permit(:name, :email, :password)
    end
    
    def logged_in_user
          unless logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_url
          end
    end
    
    def logged_in?
        !current_user.nil?
    end
end
