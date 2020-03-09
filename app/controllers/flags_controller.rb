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

  private

  def flag_params
    params.require(:flag).permit(:ingredient_id)
  end
end
