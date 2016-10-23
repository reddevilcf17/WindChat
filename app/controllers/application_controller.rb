class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  before_action :require_login

  def current_user
  	return @current_user if @current_user
  	if session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
  	
  end

  def signed_in?
  	if session[:user_id]
  		return true
  	else
  		return false
  	end   	
  end
 
  private
 
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end
end
