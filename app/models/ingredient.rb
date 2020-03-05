class Ingredient < ApplicationRecord
  # acts_as_taggable_on :tags
  has_many :flags
  has_many :products_ingredients
  has_many :products, through: :products_ingredients
  has_many :users, through: :flags

  validates :name, presence: true
end
