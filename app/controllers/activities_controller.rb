class ActivitiesController < SecuredController
  include Actionable
  
  layout 'dashboard'

  actionable :activity, [:name, :description]
end