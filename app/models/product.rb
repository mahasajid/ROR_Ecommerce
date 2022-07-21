require 'elasticsearch/model'
class Product < ApplicationRecord
  has_one_attached :image
  has_many :line_items

  validates :name, presence: true
  validates :price, presence: true


include Elasticsearch::Model
include Elasticsearch::Model::Callbacks 


settings index: {number_of_shards: 1} do
  mapping dynamic: 'false' do
  indexes :id, type: :integer
  indexes :name, type: :search_as_you_type, analyzer: 'english'
  indexes :price, type: :half_float
  indexes :description, type: :keyword
  indexes :stock , type: :integer
end
end



def self.search(query)
  __elasticsearch__.search(
  {
    query: {
       multi_match: {
         query: query,
         fields: ['name^5', 'description']
       }
     },

     highlight: {
      pre_tags: ['<mark>'],
      post_tags: ['</mark>'],
        fields: {
          name: {},
          description: {},
        }
          },


          suggest: {
          text: query,
          title: {
          term: {
            size: 1,
            field: :name
          }
          },
        body: {
          term: {
            size: 3,
            field: :description
          }
          }
          }



  })
end



end

Product.import