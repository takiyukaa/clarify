class FriendPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.friends
    end
  end
end
