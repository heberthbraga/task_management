class SecuredController < ApplicationController
  include PunditHelper

  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end