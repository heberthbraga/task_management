class DashboardController < SecuredController
  layout 'dashboard'
  
  def index
    authorize current_user, :dashboard?
  end
end