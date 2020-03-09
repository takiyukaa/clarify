class ProductsIngredient < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient
  validates :ingredient, uniqueness: { scope: :product }
  #validates uniqueness of combination
end
