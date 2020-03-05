class UsersController < ApplicationController
  def show
    @path = ""
    authorize current_user
  end
end
