class UsersController < ApplicationController
  def show
    @products = Product.all
    authorize current_user
  end
end
