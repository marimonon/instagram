class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def user_params
   params.require(:user).permit(:name, :email, :password)
  end
end
