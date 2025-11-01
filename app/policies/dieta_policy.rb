class DietaPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    record.user == user || user.is_admin?
  end

  def create?
    user.present?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.is_admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
