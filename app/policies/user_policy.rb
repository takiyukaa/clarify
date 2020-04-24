class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    true
  end

  def shelf?
    user == record || user.friends_with?(record)
  end

  def friends?
    user == record || user.friends_with?(record)
  end
end
