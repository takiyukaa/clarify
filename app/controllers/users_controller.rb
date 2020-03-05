class UsersController < ApplicationController
  def show
    @path = ""
    authorize current_user
  end

  def shelf
    @path = ""
    authorize current_user
  end
end
