# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying all produtcts..."
Product.destroy_all

puts "Seeding Products..."
5.times do
  product = Product.create(
    name: Faker::Food.vegetables,
    stock: rand(1..12),
    price: rand(11..20),
    user_id: 1
  )
  puts "Product id# #{product.id} created."
end

puts "SEEDED!"
