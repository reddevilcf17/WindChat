class SessionsController < ApplicationController
  
  skip_before_action :require_login, only: [:login, :create, :create_with_facebook]

  def login
  	
  end

  def create

  	@user = User.find_by(email: params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to messages_page_path, flash: {success: 'Welcome Back!'}
  	else
  		redirect_to login_path, notice: 'Email or Password Incorrect!'
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You have loged out!'
    
  end

  def create_with_facebook   
    puts env["omniauth.auth"].inspect
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to messages_page_path, flash: {success: 'Welcome Back!'}
  end


end
