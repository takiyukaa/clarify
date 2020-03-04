class ProductsController < ApplicationController
  def index
    # @products = Product.all
    # @products = Product.where(param[:category])
    if params[:query].present?
      @products = Product.global_search(params[:query])
      # @moisturisers = @products.where(category: "Moisturizer")
    else
      @products = Product.all
      # @moisturisers = []
    end

  end

  def show
    @product =
      if params[:barcode].blank?
        Product.find(params[:id])
      else
        Product.find_by_barcode(params[:barcode])
      end
  end

  def scan
  end
end
