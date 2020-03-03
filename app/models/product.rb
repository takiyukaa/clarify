class Product < ApplicationRecord
  has_many :products_ingredients #dependency: :destroy
  # has_many :reviews, dependency: :destroy
  has_many :ingredients, through: :products_ingredient

  validates :name, presence: true
  validates :category, presence: true
  validates :brand, presence: true
end
