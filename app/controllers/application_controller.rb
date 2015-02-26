class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :signed_in_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
