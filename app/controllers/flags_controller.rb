class FlagsController < ApplicationController
  def create
    @ingredient = ingredient.find(params[:id])
    @flag = Flag.new
    @flag.ingredient = @ingredient
    @flag.user = current_user
    @flag.save
  end
end
