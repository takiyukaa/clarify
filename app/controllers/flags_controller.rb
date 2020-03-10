class FlagsController < ApplicationController
  def create
    @flag = Flag.new(flag_params)
    @flag.user = current_user
    @flag.save
    authorize @flag
    if params[:flag][:product_id]
      redirect_to product_path(params[:flag][:product_id].to_i)
    else
      redirect_to user_path(current_user)
    end
  end

  def multi_create
    params[:flags][:id].each do |ingredient_id|
      flag = Flag.new(ingredient: Ingredient.find(ingredient_id), user: current_user)
        authorize flag
      unless flag.save
        render 'users/show'
      end
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @flag = Flag.find(params[:id])
      authorize @flag
    @flag.destroy
    redirect_to user_path(current_user)
  end

  private

  def flag_params
    params.require(:flag).permit(:ingredient_id)
  end
end
