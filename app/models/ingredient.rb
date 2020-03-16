class Ingredient < ApplicationRecord
  acts_as_taggable_on :tags
  has_many :flags
  has_many :products_ingredients
  has_many :products, through: :products_ingredients
  has_many :users, through: :flags

  validates :name, presence: true


  def icon
    if self.tag_list.first.include?("dry skin")
      @skintypeicon = "fas fa-fire-alt"
    elsif self.tag_list.first.include?("oily skin")
      @skintypeicon = "fas fa-tint"
    elsif self.tag_list.first.include?("sensitive skin")
      @skintypeicon = "fas fa-feather"
    elsif self.tag_list.first.include?("fragrance")
      @skintypeicon = "fas fa-apple-alt"
    else
      if self.tag_list.first.include?("bad")
        @skintypeicon = "fas fa-surprise"
      else self.tag_list.first.include?("good")
        @skintypeicon = "far fa-smile"
      end
    end
    @skintypeicon
  end


  def color
    if self.tag_list.first.include?("bad")
      @skintypecolor = "#aaa2a2"#red
    elsif self.tag_list.first.include?("dry")
      @skintypecolor = "#e0ae8d"#
    elsif self.tag_list.first.include?("oily")
      @skintypecolor = "#f9f59f"
    elsif self.tag_list.first.include?("sensitive")
      @skintypecolor = "#a8e28e"
    elsif self.tag_list.first.include?("fragrance")
      @skintypecolor = "#ddbff2"
    else
      @skintypecolor = "#a8e28e"
    end
    @skintypecolor
  end

end
