class DietaPolicy < ApplicationPolicy
  def index?
    record.user == user || user.is_admin?
  end

  def show?
    record.user == user || user.is_admin?
  end

  def create?
    user.present?
  end

  def update
    record.user == user || user.is_admin?
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
