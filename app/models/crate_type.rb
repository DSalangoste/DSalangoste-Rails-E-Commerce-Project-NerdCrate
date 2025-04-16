class CrateType < ApplicationRecord
  has_many :orders
  has_many :ordered_crates

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
