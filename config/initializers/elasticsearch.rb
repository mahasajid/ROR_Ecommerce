# require 'elasticsearch/model'

# Elasticsearch::Model.client = Elasticsearch::Client.new log:true, transport_options: {request: {timeout: 5}}
# # config/initializers/elasticsearch.rb
#Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']