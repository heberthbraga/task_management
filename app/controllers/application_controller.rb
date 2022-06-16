class ApplicationController < ActionController::Base
  add_flash_types :success
  
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :gender, :birthdate]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end
