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
Category.destroy_all
SubCategory.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

User.create(username: "admin", first_name: "Admin", last_name: "Admin", email: "admin@wastemarket.lol", password: "secret", address: "123 Fake St")
User.create(username: "Emy", first_name: "Emy", last_name: "Emy", email: "emy@wastemarket.lol", password: "secret", address: "123 Fake St")
User.create(username: "Jim", first_name: "Jim", last_name: "Jim", email: "jim@wastemarket.lol", password: "secret", address: "123 Fake St")
User.create(username: "Florian", first_name: "Florian", last_name: "Florian", email: "florian@waste.market.lol", password: "secret", address: "123 Fake St")
User.create(username: "Patricia", first_name: "Patricia", last_name: "Patricia", email: "patricia@waste.market.lol", password: "secret", address: "123 Fake St")
User.create(username: "Jérôme", first_name: "Jérôme", last_name: "Jérôme ", email: "jerome@wastemarket.lol", password: "secret", address: "123 Fake St")
User.create(username: "Mathieu", first_name: "Mathieu", last_name: "Mathieu", email: "mathieu@wastemarket.lol", password: "secret", address: "123 Fake St")

Category.create(name: "paint")
Category.create(name: "floors")
Category.create(name: "tools")
Category.create(name: "hardware")

SubCategory.create(name: "Outside paint", category_id: 1)
SubCategory.create(name: "Interior paint", category_id: 1)
SubCategory.create(name: "Wood paint", category_id: 1)

SubCategory.create(name: "Floor tiles", category_id: 2)
SubCategory.create(name: "Wooden floors", category_id: 2)
SubCategory.create(name: "Floating floors", category_id: 2)

SubCategory.create(name: "Hand tools", category_id: 3)
SubCategory.create(name: "Power tools", category_id: 3)
SubCategory.create(name: "Specialised tools", category_id: 3)

SubCategory.create(name: "Cleaning and maintenance", category_id: 4)
SubCategory.create(name: "Glue and adhesicve", category_id: 4)
SubCategory.create(name: "Silicone and putty", category_id: 4)
SubCategory.create(name: "DIY and craft", category_id: 4)


Product.create(name: "Painting", price: 10.00, condition: "Good", quantity_left: "25", user_id: 3, category_id: 1, sub_category_id: 2)
Product.create(name: "Nail box", price: 5.00, condition: "Average", quantity_left: "50", user_id: 3, category_id: 4, sub_category_id: 7)
Product.create(name: "Blue paint", price: 15.00, condition: "Average", quantity_left: "50", user_id: 3, category_id: 1, sub_category_id: 2)
Product.create(name: "Red paint", price: 15.00, condition: "Average", quantity_left: "50", user_id: 2, category_id: 1, sub_category_id: 2)
Product.create(name: "Green paint", price: 15.00, condition: "Average", quantity_left: "50", user_id: 2, category_id: 1, sub_category_id: 2)
Product.create(name: "Wood tile floor", price: 10.00, condition: "Good", quantity_left: "75", user_id: 3, category_id: 2, sub_category_id: 9)
Product.create(name: "Hammer", price: 5.00, condition: "Good", quantity_left: "100", user_id: 3, category_id: 3, sub_category_id: 11)


Order.create(user_id: 2, product_id: 1, progress: "done")
Order.create(user_id: 2, product_id: 2, progress: "validated")
Order.create(user_id: 2, product_id: 3, progress: "cancelled")
Order.create(user_id: 3, product_id: 4, progress: "pending")

Review.create(user_id: 2, order_id: 1, rating: 5)
Review.create(user_id: 1, order_id: 1, rating: 5)

Bookmark.create(user_id: 2, product_id: 1)

p "Finished seeding database!"
