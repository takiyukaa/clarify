class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @products = Product.global_search(params[:query])
    else
      @products = Product.all
    end
  end

  def components
  end

end
