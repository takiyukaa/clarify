class Ingredient < ApplicationRecord
  # acts_as_taggable_on :tags
  has_many :flags
  has_many :products_ingredient
  has_many :products, through: :products_ingredient
  has_many :users, through: :flag

  validates :name, presence: true
end
