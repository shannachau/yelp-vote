class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to perform this action."

      redirect_to login_path
    end
  end
end
