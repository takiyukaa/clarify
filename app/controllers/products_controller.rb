class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = policy_scope(Product).global_search(params[:query])
    else
      @products = policy_scope(Product)
    end
  end

  def show
    @product =
      if params[:barcode].blank?
        Product.find(params[:id])
      else
        Product.find_by_barcode(params[:barcode])
      end
        authorize @product
  end

  def scan
    authorize Product
  end
end
