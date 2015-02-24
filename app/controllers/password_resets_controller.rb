class PasswordResetsController < ApplicationController
  skip_before_action :signed_in_user
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    user.send_password_reset if user
    redirect_to login_url, notice: "Email sent."
  end
  
  def edit
    password_reset_token = User.digest(params[:id])
    @user = User.find_by!(password_reset_token: password_reset_token)
  end
  
  def update
    password_reset_token = User.digest(params[:id])
    @user = User.find_by!(password_reset_token: password_reset_token)
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired."
    elsif @user.update_attributes(user_params)
      redirect_to root_url, notice: "Password has been reset."
    else
      render :edit
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
