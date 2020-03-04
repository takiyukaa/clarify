class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.global_search(params[:query])
    else
      @products = Product.all
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
