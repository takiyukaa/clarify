class UsersController < ApplicationController
  def show
    @flag_ings = []
    @tag_ings = []
    @normal_ings =[]
    @path = ""
    authorize current_user
  end

  def shelf
    @path = ""
    @path_pro = ""
    authorize current_user
  end
end
