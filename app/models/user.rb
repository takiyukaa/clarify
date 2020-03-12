class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_friendship
  acts_as_taggable_on :tags
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :flags
  has_many :reviews, dependent: :destroy
  has_many :ingredients, through: :flags
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :email, presence: true

  TAG_OPTIONS = ["sensitive skin", "oily skin", "dry skin", "allergens/irritants", "reproductive toxicity", "environmental concerns", "preservatives", "parabens", "fragrance"]

  def full_name
    "#{first_name} #{second_name}"
  end

  def photo_path
    if self.photo.attached?
      @path = self.photo.key
    else
      @path = 'profile_whubsg'
    end
    @path
  end

  def shelf_hash
    @shelf_products = self.find_up_voted_items.group_by { |item| item.category }
  end
end
