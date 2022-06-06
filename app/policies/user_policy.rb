class UserPolicy < ApplicationPolicy

  def dashboard?
    user.has_any_role?(:admin, :registered) && user == record
  end
end