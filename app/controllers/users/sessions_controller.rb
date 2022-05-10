class Users::SessionsController < Devise::SessionsController
  layout 'application'

  def new
    super
  end
end