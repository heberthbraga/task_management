class TasksController < SecuredController
  include Actionable

  layout 'dashboard'

  actionable :task, [:title, :description, :start_date, :end_date]
end