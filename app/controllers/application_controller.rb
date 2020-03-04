class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description, :email, :password])
    devise_parameter_sanitizer.permit(:edit, keys: [:first_name, :last_name, :description, :email, :password])
  end
end
