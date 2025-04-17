class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_crates
  has_many :crate_types, through: :ordered_crates

  # Add any relevant validations
  validates :user, presence: true
  validates :status, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "status", "total_price", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["crate_type", "ordered_crates", "user"]
  end
end 