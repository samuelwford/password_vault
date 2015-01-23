class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  private
  
  def authenticate_user!
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
  
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def user_signed_in?
    !@current_user.nil?
  end
  helper_method :user_signed_in?
end
