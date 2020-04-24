class UsersController < ApplicationController
  def show
    @flag_ings = []
    @good_tag_ings = []
    @bad_tag_ings = []
    @normal_ings =[]
    @skintypeicon = ""
    @path = ""
    authorize current_user
  end

  def shelf
    @user = User.find(params[:id])
    @path = ""
    @path_pro = ""
    authorize @user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :show
    end
    authorize current_user
  end

  def friends
    @user = User.find(params[:id])
    @path = ""
    @path_pro = ""
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(tag_list: [])
  end
end


