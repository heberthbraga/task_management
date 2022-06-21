class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      raise Pundit::NotAuthorizedError unless user.registered?
      
      user.tasks
    end
  end

  # def create?
  #   admin?
  # end

  # def new?
  #   admin?
  # end

  # def update?
  #   admin?
  # end

  # def edit?
  #   admin?
  # end

  # def destroy?
  #   admin?
  # end

end