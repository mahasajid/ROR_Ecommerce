class Product < ApplicationRecord
  has_one_attached :image
  has_many :order_details
  has_many :orders, through: :order_details
end
