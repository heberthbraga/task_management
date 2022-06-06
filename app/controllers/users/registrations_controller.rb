class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    if resource.save
      resource.add_role(:registered)

      sign_in(:user, resource)

      redirect_to dashboard_path
    else
      render :new
    end
  end

end