class Order < ApplicationRecord
  belongs_to :user
  belongs_to :crate_type
end
