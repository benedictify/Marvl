class Offering < ApplicationRecord
  belongs_to :vendor
  belongs_to :category

  validates_associated :vendor
  validates_associated :category
end