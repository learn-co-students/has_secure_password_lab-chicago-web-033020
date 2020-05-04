class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_logged_in
    redirect_to '/login' unless logged_in?
  end
end
