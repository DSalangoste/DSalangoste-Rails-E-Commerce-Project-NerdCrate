class CrateType < ApplicationRecord
  has_many :ordered_crates
  has_many :orders, through: :ordered_crates

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end 