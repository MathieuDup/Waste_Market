# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Seeding database..."

Bookmark.destroy_all
Message.destroy_all
Review.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

User.create(username: "admin", first_name: "Admin", last_name: "Admin", email: "admin@wastemarket.lol", password: "secret", address: "123 Fake St")
User.create(username: "Emy", first_name: "Emy", last_name: "Emy", email: "emy@wastemarket.lol", password: "secret", address: "123 Fake St")
User.create(username: "Jim", first_name: "Jim", last_name: "Jim", email: "jim@wastemarket.lol", password: "secret", address: "123 Fake St")

Product.create(name: "Painting", price: 10.00, category: "Painting", sub_category: "Paint bucket", condition: "Good", quantity_left: "1L", user_id: 3)
Product.create(name: "Nail box", price: 5.00, category: "Tools", sub_category: "Nails", condition: "Average", quantity_left: "50", user_id: 3)

Order.create(user_id: 2, product_id: 1, progress: "Pending")
Order.create(user_id: 2, product_id: 2, progress: "Pending")

Review.create(user_id: 2, order_id: 1, rating: 5)
Review.create(user_id: 1, order_id: 1, rating: 5)

Bookmark.create(user_id: 2, product_id: 1)

p "Finished seeding database!"
