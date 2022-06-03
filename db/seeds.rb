# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clean DB"
Bookmark.destroy_all
Message.destroy_all
Review.destroy_all
Order.destroy_all
Product.destroy_all
Category.destroy_all
SubCategory.destroy_all
User.destroy_all
puts "DB cleaned"

p "Seeding database..."
puts "Create users"

admin = User.create(username: "admin", first_name: "Admin", last_name: "Admin", email: "admin@wastemarket.lol", password: "secret", address: "Place des Quinconces, Bordeaux")
emy = User.create(username: "Emy", first_name: "Emy", last_name: "Emy", email: "emy@wastemarket.lol", password: "secret", address: "Cours Victor Hugo, Bordeaux")
jim = User.create(username: "Jim", first_name: "Jim", last_name: "Jim", email: "jim@wastemarket.lol", password: "secret", address: "Quai Bacalan, Bordeaux")
florian = User.create(username: "Florian", first_name: "Florian", last_name: "Florian", email: "florian@waste.market.lol", password: "secret", address: "Rue Gabriel Dedieu, Lormont")
patricia = User.create(username: "Patricia", first_name: "Patricia", last_name: "Patricia", email: "patricia@waste.market.lol", password: "secret", address: "Esplanade des Antilles, Pessac")
jérôme = User.create(username: "Jérôme", first_name: "Jérôme", last_name: "Jérôme ", email: "jerome@wastemarket.lol", password: "secret", address: "Rue Calixte-Camelle, Bègles")
mathieu = User.create(username: "Mathieu", first_name: "Mathieu", last_name: "Mathieu", email: "mathieu@wastemarket.lol", password: "secret", address: "Rue Sainte Catherine, Bordeaux")

puts "Users created"

paint = Category.create!(name: "paint")
floors = Category.create!(name: "floors")
tools = Category.create!(name: "tools")
hardware = Category.create!(name: "hardware")

sub_cat_1 = SubCategory.create!(name: "Outside paint", category: paint)
sub_cat_2 = SubCategory.create!(name: "Interior paint", category: paint)
sub_cat_3 = SubCategory.create!(name: "Wood paint", category: paint)

sub_cat_4 = SubCategory.create!(name: "Floor tiles", category: floors)
sub_cat_5 = SubCategory.create!(name: "Wooden floors", category: floors)
sub_cat_6 = SubCategory.create!(name: "Floating floors", category: floors)

sub_cat_7 = SubCategory.create!(name: "Hand tools", category: tools)
sub_cat_8 = SubCategory.create!(name: "Power tools", category: tools)
sub_cat_9 = SubCategory.create!(name: "Specialised tools", category: tools)

sub_cat_10 = SubCategory.create!(name: "Cleaning and maintenance", category: hardware)
sub_cat_11 = SubCategory.create!(name: "Glue and adhesive", category: hardware)
sub_cat_12 = SubCategory.create!(name: "Silicone and putty", category: hardware)
sub_cat_13 = SubCategory.create!(name: "DIY and craft", category: hardware)


product_1 = Product.create!(name: "Painting", price: 10.00, condition: "Good", quantity_left: "25", user: jim, category: paint, sub_category: sub_cat_1)
product_2 = Product.create!(name: "Nail box", price: 5.00, condition: "Average", quantity_left: "50", user: jim, category: hardware, sub_category: sub_cat_10)
product_3 = Product.create!(name: "Blue paint", price: 15.00, condition: "Average", quantity_left: "50", user: jim, category: paint, sub_category: sub_cat_2)
product_4 = Product.create!(name: "Red paint", price: 15.00, condition: "Average", quantity_left: "50", user: emy, category: paint, sub_category: sub_cat_3)
product_5 = Product.create!(name: "Green paint", price: 15.00, condition: "Average", quantity_left: "50", user: emy, category: paint, sub_category: sub_cat_2)
product_6 = Product.create!(name: "Wood tile floor", price: 10.00, condition: "Good", quantity_left: "75", user: jim, category: floors, sub_category: sub_cat_4)
product_7 = Product.create!(name: "Hammer", price: 5.00, condition: "Good", quantity_left: "100", user: jim, category: tools, sub_category: sub_cat_8)
product_8 = Product.create!(name: "Sanitary Silicon", price: 10, brand: "Geb", characteristics: "Color: white", condition: "Good", quantity_left: "75", user: florian, category: hardware, sub_category: sub_cat_12, EAN: "3283988931505")
product_9 = Product.create!(name: "Paint multi-supports", price: 20, brand: "Colours Collection", characteristics: "Color: Beetle, Type: Satin", condition: "Good", quantity_left: "50", user: florian, category: paint, sub_category: sub_cat_2, EAN: "3454976664372")
product_10 = Product.create!(name: "Wall, wood and radiator paint ", price: 5, brand: "Ripolin", characteristics: "Color: Duck Green, Type: Satin",condition: "Average", quantity_left: "25", user: florian, category: paint, sub_category: sub_cat_2, EAN: "3174269073703")

Order.create!(user: emy, product: product_1, progress: "done", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: emy, product: product_2, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: emy, product: product_3, progress: "cancelled", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol"))
Order.create!(user: jim, product: product_4, progress: "pending", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))

Review.create!(user: emy, order: Order.first, rating: 5)
Review.create!(user: admin, order: Order.first, rating: 5)

Bookmark.create!(user: emy, product: product_1)

p "Finished seeding database!"
