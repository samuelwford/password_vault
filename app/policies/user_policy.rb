class UserPolicy < ApplicationPolicy
  def update?
    user.admin? || record == user
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