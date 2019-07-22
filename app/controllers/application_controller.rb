class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?
  
  
   #現在ログインしているユーザー
  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end
  
  #ログインしているかどうか判定
  def logged_in?
    !current_user.nil?
  end
  
end
