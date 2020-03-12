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
    @count = 0
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


  def compare


    @count = 0
    @first_product = Product.find(params["products"]["first_product"].to_i)
    @second_product = Product.find(params["products"]["id"].first)

    @common_ings = @first_product.ingredients & @second_product.ingredients
    @only_first_ings = @first_product.ingredients - @second_product.ingredients
    @only_second_ings = @second_product.ingredients - @first_product.ingredients


    authorize Product
  end



end
