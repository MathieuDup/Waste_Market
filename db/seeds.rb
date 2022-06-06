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
florian = User.create(username: "Florian", first_name: "Florian", last_name: "Florian", email: "florian@wastemarket.lol", password: "secret", address: "Rue Gabriel Dedieu, Lormont")
patricia = User.create(username: "Patricia", first_name: "Patricia", last_name: "Patricia", email: "patricia@wastemarket.lol", password: "secret", address: "Esplanade des Antilles, Pessac")
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


product_description_1 = "Crown’s breatheasy Coloured Red Silk Emulsion: – A 99% solvent free, asthma and allergy friendly interior wall and ceiling praint that can be used throughout your entire home. Now with the leading breatheasy formulation and available in the colour soft lime, this unique shade of light, pale lime green paint offers excellent versatility and complete coverage.
Paint containers made from 100% post-consumer waste plastic.
Application: Brush or Roller
Touch Dry: 2 Hours"

product_description_2 = "Crown Paints Easyclean Matt Emulsion: green- Washable & Wipeable Multi Surface Interior Paint ,
Most advanced washable, wipeable, durable and scrubbable multi surface interior emulsion paint. Offering excellent versatility and complete coverage, this multi surface matt emulsion paint can be applied throughout your entire home. Easyclean Matt Emulsion can also be used on popular interior wood and metals. NEW - Introducing breatheasy - Crown’s Leading 99% Solvent Free Formulation
Application: Brush or Roller
Touch Dry: 3 Hours"

product_description_3 = "Farrow & Ball Water Based and child safe : blue - Washable & Wipeable Multi Surface interior Paint
These low-odour, low-VOC finishes are easy to clean without harmful solvents. They are also certified child- and baby-safe in accordance with Safety of Toys Part 3: Migration of certain elements (EN 71-3:2019+A1:2021).Exclusions: Casein Distemper, Wood Floor Primer & Undercoat, Wood Knot & Resin Blocking Primer & Undercoat, and Metal Primer & Undercoat.
Application: Brush or Roller
Touch Dry: 3 Hours"

product_description_4 = "Dulux Trade Eggshell is a solvent-based mid-sheen finish formulation that is tough and durable and does not require an undercoat except where a strong colour change is required. Suitable for use on interior wood and metal surfaces.
Application: Brush or Roller
Touch Dry: 3 Hours"

product_description_5 = "Valentine Trade Airsure Vinyl Matt
A top quality, high opacity interior emulsion which gives excellent coverage with a high quality finish. It is 99.9% VOC Free*, to minimise the impact on indoor air quality**. Suitable for all normal interior wall and ceiling surfaces. *Based on in-can VOC content, measured in accordance with ISO 11890-2:2013.
** Independently tested for emissions, including formaldehyde, TVOC, TSVOC and Cat 1A & 1B carcinogens
Application: Brush or Roller
Touch Dry: 3 Hours"

product_description_6 = "LeroyMerlin Pack of steel nails
This pack of 60 olive coated shallow countersunk nails are constructed from durable carbon steel. They are 40mm in length, have a 4mm diameter and come partially threaded for 38mm.
Resistant to rust
Features and benefits
Recommended for outdoor use
This pack is ideal for a range of DIY projects"

product_description_7 = "BricoMarket Pack of 5 boards
This thick whitewood flooring is simple to install and treated to be a long-lasting, luxury floor for your home.
The irresistible natural beauty of solid wood flooring remains a popular choice for many. The look and feel of the woodgrain coupled with the thermal insulation properties of wood will make your chosen space one of tranquility and warmth. Solid wood flooring is susceptible to moisture and humidity changes, making it sensitive to seasonal changes, so you’ll need to consider acclimatisation before installation but once laid, and with maintenance the hardwearing nature of wood flooring means it’s a great long term option for your home."

product_description_8 = "High performance acetoxy silicone for sealing around baths, showers, basins and sanitary ware. Provides a watertight flexible seal with anti-fungal properties. Fast curing, UV-resistant."

product_1 = Product.create!(name: "Painting", price: 10.00, condition: "Good", quantity_left: "25", user: jim, category: paint, sub_category: sub_cat_1, description: product_description_1 )
product_2 = Product.create!(name: "Pack of nails", price: 5.00, condition: "Average", quantity_left: "50", user: jim, category: hardware, sub_category: sub_cat_10, description: product_description_6)
product_3 = Product.create!(name: "Blue paint", price: 15.00, condition: "Average", quantity_left: "50", user: jim, category: paint, sub_category: sub_cat_2, description: product_description_3)
product_4 = Product.create!(name: "Red paint", price: 15.00, condition: "Average", quantity_left: "50", user: emy, category: paint, sub_category: sub_cat_3, description: product_description_5)
product_5 = Product.create!(name: "Green paint", price: 15.00, condition: "Average", quantity_left: "50", user: emy, category: paint, sub_category: sub_cat_2, description: product_description_2 )
product_6 = Product.create!(name: "Wood tile floor", price: 10.00, condition: "Good", quantity_left: "75", user: jim, category: floors, sub_category: sub_cat_4, description:product_description_7)
product_7 = Product.create!(name: "Hammer", price: 5.00, condition: "Good", quantity_left: "100", user: jim, category: tools, sub_category: sub_cat_8, description: "Very powerfull hamer for daily use")
product_8 = Product.create!(name: "Sanitary Silicon", price: 10, brand: "Geb", characteristics: "Color: white", condition: "Good", quantity_left: "75", user: florian, category: hardware, sub_category: sub_cat_12, EAN: "3283988931505", description: product_description_8)
product_9 = Product.create!(name: "Paint multi-supports", price: 20, brand: "Colours Collection", characteristics: "Color: Beetle, Type: Satin", condition: "Good", quantity_left: "50", user: florian, category: paint, sub_category: sub_cat_2, EAN: "3454976664372", description: product_description_1)
product_10 = Product.create!(name: "Wall, wood and radiator paint ", price: 5, brand: "Ripolin", characteristics: "Color: Duck Green, Type: Satin",condition: "Average", quantity_left: "25", user: florian, category: paint, sub_category: sub_cat_2, EAN: "3174269073703", description: product_description_4)

Order.create!(user: emy, product: product_1, progress: "done", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: emy, product: product_2, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: emy, product: product_3, progress: "cancelled", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol"))
Order.create!(user: jim, product: product_4, progress: "pending", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))

Review.create!(user: emy, order: Order.first, rating: 5)
Review.create!(user: admin, order: Order.first, rating: 5)

Bookmark.create!(user: emy, product: product_1)

p "Finished seeding database!"
