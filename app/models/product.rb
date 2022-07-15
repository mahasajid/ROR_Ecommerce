require 'elasticsearch/model'
class Product < ApplicationRecord
  has_one_attached :image
  has_many :line_items

  validates :name, presence: true
  validates :price, presence: true


include Elasticsearch::Model
include Elasticsearch::Model::Callbacks 


end
