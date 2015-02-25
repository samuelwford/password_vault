class SessionsController < ApplicationController
  skip_before_filter :signed_in_user, only: [:new, :create, :omniauth_callback]
  
  def new
  end

  def omniauth_callback
    auth = request.env["omniauth.auth"]
    user = User.find_for_google_oauth2(auth)
    if user.nil? 
      flash[:notice] = "Only authorized accounts are permitted."
      redirect_to login_url
    else
      sign_in user
      redirect_back_or user
    end
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user, params[:remember_me]
      redirect_back_or user
    else
      flash.now.alert = "Invalid email or password."
      render :new
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url, notice: 'Logged out.'
  end
end
