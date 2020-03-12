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
    # Ingredient.tagged_with(ingredients_tag_list_good, any: true).map(&:products).flatten.uniq.select { |product| product.category == category}.first(5)
    Ingredient.tagged_with(ingredients_tag_list_good, any: true).map(&:products).flatten.uniq.select { |product| product.category == category}.sort_by(&:created_at).first(5)
  end


  def photo_path
    if self.photo.attached?
      @path = self.photo.key
    else
      @path = 'no_image'
    end
    @path
  end

  def count_bad(user)
    @count = 0
    self.ingredients.each do |ingredient|
      if user.tag_list.map {|tag| "bad for #{tag}" }.include?(ingredient.tag_list.first)
        @count += 1
      elsif user.ingredients.include?(ingredient)
        @count += 1
      end
    end
    @count
  end

  def count_good(user)
    @count = 0
    self.ingredients.each do |ingredient|
      @count += 1 if user.tag_list.map {|tag| "good for #{tag}" }.include?(ingredient.tag_list.first)
    end
    @count
  end


  def flag_ings(user)
    @flag_ings = []

    self.ingredients.each do |ingredient|
      @flag_ings << ingredient if user.ingredients.include?(ingredient)
    end

    @flag_ings
  end

  def badtag_ings(user)
    @badtag_ings = []

    self.ingredients.each do |ingredient|
      @badtag_ings << ingredient if user.tag_list.map {|tag| "bad for #{tag}" }.include?(ingredient.tag_list.first)
    end
    @badtag_ings
  end

  def goodtag_ings(user)
    @goodtag_ings = []

    self.ingredients.each do |ingredient|
      @goodtag_ings << ingredient if user.tag_list.map {|tag| "good for #{tag}" }.include?(ingredient.tag_list.first)
    end
    @goodtag_ings
  end

  def normal_ings(user)
    @normal_ings = []

    self.ingredients.each do |ingredient|
      unless user.ingredients.include?(ingredient) || user.tag_list.map {|tag| "good for #{tag}" }.include?(ingredient.tag_list.first) || user.tag_list.map {|tag| "bad for #{tag}" }.include?(ingredient.tag_list.first)
        @normal_ings << ingredient
      end
    end
    @normal_ings
  end
end
