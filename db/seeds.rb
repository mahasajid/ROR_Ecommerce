# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

(70..100).each do |id|
    Product.create!(
    id: id,
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Company.bs,
    stock: Faker::Number.between(0,200)
    )
end