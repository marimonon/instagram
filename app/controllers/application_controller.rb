class ApplicationController < ActionController::Base

  # 　ストロングパラメーター対策（:nameの追加）
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:uid,:provider,:image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:uid,:provider,:image])
    end
    
    def after_sign_in_path_for(resource)
      '/posts'
    end

  def log_in(user)
    session[:user_id] = user.id
  end

  # def current_user
  #   if session[:user_id]
  #   #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
  #     @current_user ||= User.find_by(id: session[:user_id])
  #   end
  # end

  # def current_user?(user)
  #   user == current_user
  # end

  # def logged_in?
  #   !current_user.nil?
  # end

  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end
end
