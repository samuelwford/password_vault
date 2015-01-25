class SessionsController < ApplicationController
  skip_before_filter :signed_in_user, only: [:new, :create]
  
  def new
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
