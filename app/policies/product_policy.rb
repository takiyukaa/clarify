class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def like?
    !user.nil?
  end

  def unlike?
    !user.nil?
  end

  def show?
    true
  end

  def scan?
    true
  end
end
