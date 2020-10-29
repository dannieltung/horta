# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying all products..."
Product.destroy_all

# puts "Destroying all transactions..."
# Transaction.destroy_all

puts "Destroying all users..."
User.destroy_all

puts "Seeding Users..."
2.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(domain: 'gmail.com'),
    password: "123456"
  )
  puts "User #{user.email} with id# #{user.id} created"
  puts "Seeding Products..."
  2.times do
    product = Product.create(
      name: Faker::Food.vegetables,
      stock: rand(1..12),
      price: rand(11..20),
      user_id: user.id
    )
    puts "Product id# #{product.id} created."
  end
end

puts "SEEDED!"
