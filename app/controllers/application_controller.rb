class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  force_ssl

private
  def current_user
    @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user
  
end
