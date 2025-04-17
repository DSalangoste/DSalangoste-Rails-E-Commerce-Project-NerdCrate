class CrateType < ApplicationRecord
  has_one_attached :image
  has_many :ordered_crates
  has_many :orders, through: :ordered_crates

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, content_type: ['image/png', 'image/jpeg', 'image/jpg'], 
                   size: { less_than: 5.megabytes }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["ordered_crates", "orders", "image_attachment", "image_blob"]
  end
end 