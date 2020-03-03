class ProductsIngredient < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient
end
