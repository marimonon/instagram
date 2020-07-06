class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js #=> app/views/relationships/create.js.erb
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  
private
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
