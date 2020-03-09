class UsersController < ApplicationController
  def show
    @path = ""
    authorize current_user
  end

  def shelf
    @user = User.find(params[:id])
    @path = ""
    @path_pro = ""
    authorize @user
  end
end


