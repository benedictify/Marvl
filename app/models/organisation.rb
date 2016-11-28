class Organisation < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :documents, through: :users

  validates :name, presence: true
  validates :name, uniqueness: true
end
