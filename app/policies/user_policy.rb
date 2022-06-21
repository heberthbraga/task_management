class UserPolicy < ApplicationPolicy

  def dashboard?
    any_user? && owner?
  end
end