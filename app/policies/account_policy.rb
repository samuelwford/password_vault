class AccountPolicy < ApplicationPolicy
  def update?
    user.admin? || user.groups.include?(record.group)
  end
  
  def destroy?
    user.admin?
  end
  
  def create?
    true
  end
  
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(group: user.groups)
      end
    end
  end
end