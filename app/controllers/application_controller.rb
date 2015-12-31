class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, id: :devise_controller?
before_filter :configure_permitted_parameters, if: :devise_controller?

protect_from_forgery with: :exception

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password) }
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
