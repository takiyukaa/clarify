class Product < ApplicationRecord
  acts_as_votable
  has_many :products_ingredients
  has_many :reviews
  has_many :ingredients, through: :products_ingredients

  has_one_attached :photo
  validates :name, presence: true
  validates :category, presence: true
  validates :brand, presence: true

  include PgSearch::Model
    pg_search_scope :global_search,
    against: [ :name, :brand, :category ],
    associated_against: {
      ingredients: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

    def ingredients_tag_list_good
      ingredients.map(&:tag_list).flatten.uniq.delete_if {|ingredient| ingredient.start_with?("bad")}
    end

    def related_products
      Ingredient.tagged_with(ingredients_tag_list_good, any: true).map(&:products).flatten.uniq
    end
end
