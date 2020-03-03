class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # acts_as_taggable_on :tags
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flags
  has_many :reviews, dependent: :destroy
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :email, presence: true

  def full_name
    "#{first_name} #{second_name}"
  end

end
