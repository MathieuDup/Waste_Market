# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "open-uri"

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
florian.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1653664783/production/art8j5rd0rrosuhnojwg18vm5m5a.png"), filename: "florian.png", content_type: "image/png")
patricia = User.create(username: "Patricia", first_name: "Patricia", last_name: "Patricia", email: "patricia@wastemarket.lol", password: "secret", address: "Esplanade des Antilles, Pessac")
patricia.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1653489237/production/dlwv2easr8220lf8i8lwi7xjwt1m.png"), filename: "patricia.png", content_type: "image/png")
jerome = User.create(username: "Jérôme", first_name: "Jérôme", last_name: "Jérôme ", email: "jerome@wastemarket.lol", password: "secret", address: "Rue Calixte-Camelle, Bègles")
jerome.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1653489216/production/7f8dwvtk4vvhpg0od10qsttajwk9.png"), filename: "jerome.png", content_type: "image/png")
mathieu = User.create(username: "Mathieu", first_name: "Mathieu", last_name: "Mathieu", email: "mathieu@wastemarket.lol", password: "secret", address: "Rue Sainte Catherine, Bordeaux")
mathieu.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1653489206/production/2b2kvxs09x6aiyehs6fbwyng1v3z.png"), filename: "mathieu.png", content_type: "image/png")

puts "Users created"

puts "Creating categories ..."

paint = Category.create!(name: "paint")
tiles = Category.create!(name: "tiles")
tools = Category.create!(name: "tools")
hardware = Category.create!(name: "hardware")

sub_cat_1 = SubCategory.create!(name: "Outside paint", category: paint)
sub_cat_2 = SubCategory.create!(name: "Interior paint", category: paint)
sub_cat_3 = SubCategory.create!(name: "Wood paint", category: paint)

sub_cat_4 = SubCategory.create!(name: "Floor tiles", category: tiles)
sub_cat_5 = SubCategory.create!(name: "Outside tiles", category: tiles)
sub_cat_6 = SubCategory.create!(name: "Wall tiles", category: tiles)

sub_cat_7 = SubCategory.create!(name: "Hand tools", category: tools)
sub_cat_8 = SubCategory.create!(name: "Power tools", category: tools)
sub_cat_9 = SubCategory.create!(name: "Specialised tools", category: tools)

sub_cat_10 = SubCategory.create!(name: "Cleaning and maintenance", category: hardware)
sub_cat_11 = SubCategory.create!(name: "Glue and adhesive", category: hardware)
sub_cat_12 = SubCategory.create!(name: "Silicone and putty", category: hardware)
sub_cat_13 = SubCategory.create!(name: "DIY and craft", category: hardware)

puts "Creating products ..."

product_description_1 = "Our high-quality PVC flooring plank set consists of 18 planks, each with a size of 122.8 x
23.8 cm, providing a total area of 5.26 m. It will be an ideal choice for busy floors, such as kitchens, bathrooms,
living rooms, etc."

product_description_2 = "The smart design of Malmo luxury vinyl flooring brings beauty and elegance as well as wear
resistance and functionality to any space."

product_description_3 = "Plumber's Putty is a ready-mixed, waterproof, non-setting putty designed for sealing and
bedding w/c soil pipes, joints in sanitaryware, sinks and waste water fittings. "

product_description_4 = "Bird Brand 0120 White Spirit 2 LitreA high quality and general purpose solvent with 100�s of
uses. Most generally used to thin solvent based paint and clean brushes and equipment."

product_description_5 = "The all-purpose way to bond building materials. It's so versatile, it grabs virtually anything
instantly. Use it indoors or out, even underwater, for an extra tough bond that'll last."

product_description_6 = "A box of galvanised square twist nails"

product_description_7 = "Slip resistant ergonomic grips. External latch design for ease of use. Used to crimp round
metal pipe, gutters, and downspouts"

product_description_8 = "This VonHaus Chisel Set is just the job for cutting and shaping wood and features a
comprehensive range of tools ideal for tackling intricate and demanding jobs alike."

product_description_9 = "The Terratek 18V Cordless Drill Driver offers both power and control with its soft grip and
ergonomic design, allowing for ease of use when operating. It is also lightweight at just 1kg, making it highly
manoeuvrable."

product_description_10 = "Our exclusive range of flat matt emulsion has been specially developed to bring a timeless
elegance to your home."

product_description_11 = "Johnstone's No Ordinary Paint Water Based Soft Sheen is a premium quality emulsion. It is a
more contemporary and subtle finish to silk, great for walls and ceilings where a satin finish is required."

product_description_12 = "Dulux Silk is a smooth and creamy emulsion paint for use on walls and ceilings,
giving a delicate shine finish. Chromalock technology Water based"

product_description_13 = "Dulux Weathershield All Weather Protection Smooth Masonry Paint is an exterior wall paint
formulated with our unique Stay Clean technology that protects against dirt and mould growth within the paint film for
long lasting colour and finish."

product_description_14 = "This Gorilla hammer offers an increased striking power and reduced vibration.
Roughneck Gorilla V-Series claw hammers are manufactured from drop forged hardened and tempered steel."

product_description_15 = "Glazed porcelain stoneware in 20x20cm format, for wall covering, suitable for any room in the
house. 3D effect obtained thanks to a particular technology that combines the structures of these objects with the
graphics and colors of the collection."

product_description_16 = "Deck tiles create a beautiful space both inside and outside, The interlocking wood tiles can
be installed on top of concrete, wood, carpet, pavers, or any other solid surface. Great for decks, patios, balconies,
around pools, saunas, showers, sun rooms, mud rooms, bedrooms, and more."

product_description_17 = "Silicone mastic for sanitary joints. Sealing joints for sinks, bathtubs, showers, tiles, etc."

product_description_18 = "Refresh your interior in a flash with Colours Collection Scarab Satin Multi-Surface Paint.
A complete product with integrated undercoat, suitable for all surfaces in the house: walls, woodwork, radiators, etc."

product_description_19 = "A top quality, high opacity interior emulsion which gives excellent coverage with a high
quality finish. It is 99.9% VOC Free, to minimise the impact on indoor air quality."

product_1 = Product.create!(name: "PVC Flooring Planks", price: 50, brand: "Living Home", characteristics: "Color: Grey, Type: PVC, Length: 122cm", condition: "Good", quantity_left: "50", user: jerome, category: tiles, sub_category: sub_cat_4, description: product_description_1)
product_1.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673573/production/vinyl_xjbgsu.webp"), filename: "vinyl_xjbgsu.webp", content_type: "image/webp")
product_2 = Product.create!(name: "Ivar Floor Plank", price: 60, brand: "Malmo", characteristics: "Color: Light brown, Type: Wood, Length: 122cm", condition: "Good", quantity_left: "75", user: mathieu, category: tiles, sub_category: sub_cat_4, description: product_description_2)
product_2.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/plank_flooring_rmjg2p.jpg"),filename: "plank_flooring_rmjg2p.jpg", content_type: "image/jpg")
product_3 = Product.create!(name: "Plumber's Putty", price: 2, brand: "Ever Build", characteristics: "Color: White, Type: Sealing, Original Quantity: 750g", condition: "Average", quantity_left: "25", user: florian, category: hardware, sub_category: sub_cat_12, description: product_description_3)
product_3.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673573/production/putty_kxujtz.webp"), filename: "putty_kxujtz.webp", content_type: "image/webp")
product_4 = Product.create!(name: "White Spirit", price: 8, brand: "Bird Brand", characteristics: "Type: Solvent, Original Quantity: 2L", condition: "Perfect", quantity_left: "75", user: jerome, category: hardware, sub_category: sub_cat_10, description: product_description_4)
product_4.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673573/production/white_spirit_gi4eyk.webp"), filename: "white_spirit_gi4eyk.webp", content_type: "image/webp")
product_5 = Product.create!(name: "Gorilla Glue", price: 5, brand: "Gorilla", characteristics: "Use: Wood, Plastic, Glass, Metal, Original Quantity: 290ML", condition: "Good", quantity_left: "50", user: jerome, category: hardware, sub_category: sub_cat_11, description: product_description_5)
product_5.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/gorilla_glue_cgltke.webp"), filename: "gorilla_glue_cgltke.webp", content_type: "image/webp")
product_6 = Product.create!(name: "Pack of Nails", price: 7, brand: "TIMco", characteristics: "Type: Stainless steel, Original Quantity: 2.5kg", condition: "Good", quantity_left: "75", user: florian, category: hardware, sub_category: sub_cat_13, description: product_description_6)
product_6.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/nail_box_t3mavz.webp"), filename: "nail_box_t3mavz.webp", content_type: "image/webp")
product_7 = Product.create!(name: "Blade Crimper", price: 15, brand: "DeWalt", condition: "Average", user: mathieu, category: tools, sub_category: sub_cat_7, description: product_description_7)
product_7.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673573/production/blade_crimper_uhhc2l.webp"), filename: "blade_crimper.webp", content_type: "image/webp")
product_8 = Product.create!(name: "Chisel Set", price: 30, brand: "VonHaus", condition: "Good", user: mathieu, category: tools, sub_category: sub_cat_9, description: product_description_8)
product_8.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673573/production/chisel_x6cwyu.jpg"), filename: "chisel_x6cwyu.jpg", content_type: "image/jpg")
product_9 = Product.create!(name: "Cordless Drill", price: 20, brand: "Terratek", condition: "Good", user: mathieu, category: tools, sub_category: sub_cat_8, description: product_description_9)
product_9.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/drill_driver_zvsacq.webp"), filename: "cordless_drill_xjbgsu.webp", content_type: "image/webp")
product_10 = Product.create!(name: "Paint Origins", price: 5, brand: "Dulux", condition: "Good", characteristics: "Color: Brown, Original Quantity: 125ML", quantity_left: "50", user: florian, category: paint, sub_category: sub_cat_1, description: product_description_10)
product_10.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673573/production/authentic_origins_dee2q7.webp"), filename: "paint_origins_xjbgsu.webp", content_type: "image/webp")
product_11 = Product.create!(name: "Paint Water Based", price: 5, brand: "Johnstone's", condition: "Good", characteristics: "Color: Deep Amethyst, Original Quantity: 2.5L", quantity_left: "25", user: mathieu, category: paint, sub_category: sub_cat_2, description: product_description_11)
product_11.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/johnstone_s_wall_ceiling_hirof2.webp"), filename: "johnstone_s_wall_ceiling_hirof2.webp", content_type: "image/webp")
product_12 = Product.create!(name: "Paint Silk", price: 25, brand: "Dulux", condition: "Good", characteristics: "Color: Camel, Original Quantity: 5L", quantity_left: "50", user: florian, category: paint, sub_category: sub_cat_2, description: product_description_12)
product_12.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/dulux_naturalhints_fmb2ls.webp"), filename: "dulux_naturalhints_fmb2ls.webp", content_type: "image/webp")
product_13 = Product.create!(name: "Paint Weathershield", price: 15, brand: "Dulux", condition: "Good", characteristics: "Color: Grey, Original Quantity: 2.5L", quantity_left: "50", user: jerome, category: paint, sub_category: sub_cat_3, description: product_description_13)
product_13.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/dulux_weathershield_qxrdss.webp"), filename: "dulux_weathershield_qxrdss.webp", content_type: "image/webp")
product_14 = Product.create!(name: "Hammer", price: 20, brand: "Gorilla", condition: "Good", characteristics: "Type: V-Series", user: jerome, category: tools, sub_category: sub_cat_7, description: product_description_14)
product_14.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/hammer_l8volk.webp"), filename: "hammer_l8volk.webp", content_type: "image/webp")
product_15 = Product.create!(name: "Cement wall tile", price: 20, brand: "Leroy Merlin", condition: "Good", characteristics: "Color: White, Size: 20 x 20 cm", quantity_left: "25", user: jerome, category: tiles, sub_category: sub_cat_5, description: product_description_15)
product_15.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/kitchen_tile_vgerzo.jpg"), filename: "kitchen_tile_vgerzo.jpg", content_type: "image/jpg")
product_16 = Product.create!(name: "Deck tiles", price: 20, brand: "Rakyto", condition: "Good", characteristics: "Color: Brown, Type: Acacia, Size: 40 x 40 cm", quantity_left: "25", user: mathieu, category: tiles, sub_category: sub_cat_6, description: product_description_16)
product_16.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654673574/production/Outside_floor_tile_ewlcci.jpg"), filename: "Outside_floor_tile_ewlcci.jpg", content_type: "image/jpg")
product_17 = Product.create!(name: "Sanitary Silicon", price: 10, brand: "Geb", characteristics: "Color: white", user: mathieu, category: hardware, sub_category: sub_cat_12, EAN: "3283988931505", description: product_description_17)
product_17.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654596577/production/mastic-silicone-gebsicone_ymnhfd.jpg"), filename: "mastic-silicone-gebsicone_ymnhfd.jpg", content_type: "image/jpg")
product_18 = Product.create!(name: "All-around paint", price: 20, brand: "Colours Collection", characteristics: "Color: Beetle, Type: Satin", condition: "Good", quantity_left: "50", user: mathieu, category: paint, sub_category: sub_cat_2, EAN: "3454976664372", description: product_description_18)
product_18.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654596577/production/peinture-multi-supports-scarab-e-satin-0-75l_3454976664372_02c_tqo4fk.webp"), filename: "peinture-multi-supports-scarab-e-satin-0-75l_3454976664372_02c_tqo4fk.webp", content_type: "image/webp")
product_19 = Product.create!(name: "Wall, wood and radiator paint ", price: 5, brand: "Ripolin", characteristics: "Color: Duck Green, Type: Satin", condition: "Average", quantity_left: "25", user: mathieu, category: paint, sub_category: sub_cat_2, EAN: "3174269073703", description: product_description_19)
product_19.photo.attach(io: URI.open("https://res.cloudinary.com/dtfxmzzss/image/upload/v1654596577/production/5622880_C_r9x7wg.jpg"), filename: "5622880_C_r9x7wg.jpg", content_type: "image/jpg")

Order.create!(user: patricia, product: product_5, progress: "done", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: patricia, product: product_2, progress: "done", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: patricia, product: product_3, progress: "cancelled", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol"))
Order.create!(user: mathieu, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: mathieu, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: mathieu, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: mathieu, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: mathieu, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: jerome, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: jerome, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: jerome, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: jerome, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: jerome, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: jim, product: product_3, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))
Order.create!(user: jim, product: product_17, progress: "validated", qr_code: RQRCode::QRCode.new("http://www.wastemarket.lol/"))

Review.create!(user: mathieu, order_id: 1, rating: 5)
Review.create!(user: mathieu, order_id: 2, rating: 4)
Review.create!(user: mathieu, order_id: 3, rating: 3)
Review.create!(user: mathieu, order_id: 4, rating: 4)
Review.create!(user: jerome, order_id: 5, rating: 3)
Review.create!(user: jerome, order_id: 6, rating: 5)
Review.create!(user: jerome, order_id: 7, rating: 4)
Review.create!(user: jerome, order_id: 8, rating: 3)
Review.create!(user: jim, order_id: 9, rating: 4)
Review.create!(user: jim, order_id: 10, rating: 3)
Review.create!(user: jim, order_id: 11, rating: 2)
Review.create!(user: jim, order_id: 12, rating: 1)
Review.create!(user: jerome, order_id: 13, rating: 5)

Bookmark.create!(user: patricia, product: product_1)
Bookmark.create!(user: patricia, product: product_5)
Bookmark.create!(user: patricia, product: product_8)

p "Finished seeding database!"
