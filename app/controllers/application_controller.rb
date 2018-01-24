class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   helper_method :current_user, :logged_in?, :is_admin?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
     !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  def is_admin?
    current_user.admin?
  end
  def require_admin
     if logged_in? and !is_admin?
       flash[:danger] = "Only admin users can perform that action"
       redirect_to root_path
     end
  end
end
