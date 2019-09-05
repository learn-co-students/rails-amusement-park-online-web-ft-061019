class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
