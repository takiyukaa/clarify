class UsersController < ApplicationController
  def show
    @path = ""
    authorize current_user
  end

  def shelf
    @path = ""
    @path_pro = ""
    authorize current_user
  end
end
