class CrateType < ApplicationRecord
<<<<<<< HEAD
end
=======
  has_many :ordered_crates
  has_many :orders, through: :ordered_crates

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end 
>>>>>>> 6b2b14f7e48e3d65002eebbb44075d76a6fc0752
