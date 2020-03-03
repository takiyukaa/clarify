class Ingredient < ApplicationRecord
  has_many :flags #dependency: :destroy
  has_many :products_ingredient #dependency: :destroy
  has_many :products, through: :products_ingredient
  has_many :users, through: :flag

  validates :name, presence: true
end
