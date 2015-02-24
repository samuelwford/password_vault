class GroupPolicy < ApplicationPolicy
  def update?
    user.admin? || user.groups.include?(record)
  end
  
  def destroy?
    user.admin?
  end
  
  def create?
    user.admin?
  end
  
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        user.groups
      end
    end
  end
end