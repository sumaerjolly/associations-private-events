# frozen_string_literal: true

module UsersHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if current_user

    flash[:danger] = 'You must be logged in to perform this action'
    redirect_to login_path
  end
end
