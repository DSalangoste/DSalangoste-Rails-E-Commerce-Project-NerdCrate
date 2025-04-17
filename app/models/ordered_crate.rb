class OrderedCrate < ApplicationRecord
  belongs_to :order
  belongs_to :crate_type

  validates :order, presence: true
  validates :crate_type, presence: true
  validates :status, presence: true

  # ... your existing associations and validations ...

  def self.ransackable_attributes(auth_object = nil)
    ["crate_type_id", "created_at", "customization_options", "id", "id_value", "order_id", "status", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order", "crate_type"]
  end
end 