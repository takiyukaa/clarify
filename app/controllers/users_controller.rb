class UsersController < ApplicationController
  def show
    @flag_ings = []
    @tag_ings = []
    @normal_ings =[]
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


