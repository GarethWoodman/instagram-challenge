class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # get current user from session
  # current_user can be accessed from any controller
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
