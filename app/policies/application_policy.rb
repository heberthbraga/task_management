# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    p user
    p "record #{record}"
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      p user
      p "scope #{scope}"
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

  protected

  def admin?
    user.admin?
  end

  def any_user?
    user.has_any_role?(:admin, :registered)
  end

  def registered_user?
    user.registered?
  end

  def owner?
    user == record
  end
end
