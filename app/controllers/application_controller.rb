class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :signed_in_user
end
