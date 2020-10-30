# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying all transactions..."
Transaction.destroy_all

puts "Destroying all products..."
Product.destroy_all

puts "Destroying all users..."
User.destroy_all

puts "Seeding Start..."
1.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user1@gmail.com",
    password: "123456"
  )
  puts "User #{user.email} with id# #{user.id} created"
  puts "Seeding Products..."
  1.times do
    product = Product.create(
      name: Faker::Food.vegetables,
      stock: rand(1..12),
      price: rand(11..20),
      address: "Avenida Paulista, 320 São Paulo",
      user_id: user.id
    )
    puts "Product id# #{product.id} created."
  end
  1.times do
    product = Product.create(
      name: Faker::Food.vegetables,
      stock: rand(1..12),
      price: rand(11..20),
      address: "Rua Frei Caneca, 569 São Paulo",
      user_id: user.id
    )
    puts "Product id# #{product.id} created."
  end
  1.times do
    product = Product.create(
      name: Faker::Food.vegetables,
      stock: rand(1..12),
      price: rand(11..20),
      address: "Rua Augusta, 2499 São Paulo",
      user_id: user.id
    )
    puts "Product id# #{product.id} created."
  end
end

1.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user2@gmail.com",
    password: "123456"
  )
  puts "User #{user.email} with id# #{user.id} created"
  puts "Seeding Products..."
  1.times do
    product = Product.create(
      name: Faker::Food.vegetables,
      stock: rand(1..12),
      price: rand(11..20),
      address: "Rua Augusta, 2860 São Paulo",
      user_id: user.id
    )
    puts "Product id# #{product.id} created."
  end
  1.times do
    product = Product.create(
      name: Faker::Food.vegetables,
      stock: rand(1..12),
      price: rand(11..20),
      address: "Rua São Bento, 293 São Paulo",
      user_id: user.id
    )
    puts "Product id# #{product.id} created."
  end
  1.times do
    product = Product.create(
      name: Faker::Food.vegetables,
      stock: rand(1..12),
      price: rand(11..20),
      address: "Avenida da Liberdade, 863 São Paulo",
      user_id: user.id
    )
    puts "Product id# #{product.id} created."
  end
end

puts "SEEDED!"
