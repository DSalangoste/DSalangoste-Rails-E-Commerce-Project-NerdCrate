class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :address, presence: true
end 