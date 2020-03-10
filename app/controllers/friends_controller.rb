class FriendsController < ApplicationController

 def index
    @friends = policy_scope(User)
    authorize @friends
  end
end
