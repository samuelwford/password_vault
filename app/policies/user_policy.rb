class UserPolicy < ApplicationPolicy
  def show?
    true
  end
  
  def update?
    user.admin? || record == user
  end
  
  def create?
    user.admin?
  end
  
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end