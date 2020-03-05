class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = policy_scope(Product).global_search(params[:query])
    else
      @products = policy_scope(Product)
    end
  end

  def like
    product = Product.find(params[:id])
    authorize product
    current_user.likes(product)
    redirect_to product_path(product)
  end

  def unlike
    product = Product.find(params[:id])
    authorize product
    current_user.unlike(product)
    redirect_to product_path(product)
  end

  def show
    @path = ""
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
