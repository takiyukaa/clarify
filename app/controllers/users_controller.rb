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

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :show
    end
    authorize current_user
  end

  private

  def user_params
    params.require(:user).permit(tag_list: [])
  end
end
