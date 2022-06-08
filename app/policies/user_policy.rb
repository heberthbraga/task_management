class UserPolicy < ApplicationPolicy

  def dashboard?
    any_user?
  end
end