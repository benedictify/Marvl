class Category < ApplicationRecord
  has_many :offerings
  has_many :vendors, through: :offerings
  has_many :reviews, through: :vendors

  validates :name, presence: true
  validates :name, uniqueness: true
end
