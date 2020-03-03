class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :content, presence: true
  validates :title, presence: true
  validates :rating, numericality: { only_integer: true }, presence: true, inclusion: { in: (0..5) }
end
