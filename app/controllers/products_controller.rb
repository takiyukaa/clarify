class ProductsController < ApplicationController

  def index
    @products = Product.all
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
