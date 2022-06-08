class CategoriesController < SecuredController
  include Actionable
  
  layout 'dashboard'

  actionable :category, [:name]
end