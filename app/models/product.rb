class Product < ApplicationRecord
  has_many :products_ingredients
  has_many :reviews
  has_many :ingredients, through: :products_ingredient

  has_one_attached :photo
  validates :name, presence: true
  validates :category, presence: true
  validates :brand, presence: true
end
