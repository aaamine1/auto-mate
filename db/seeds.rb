# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'
require 'rubocop-faker'
require "open-uri"
Item.destroy_all
Product.destroy_all
Booking.destroy_all
VendingMachine.destroy_all
User.destroy_all

addresses = ["Anneessens, 1000 Brussels", "Rue Van Artevelde 45, 1000 Bruxelles",
  "DE SINGEL, Desguinlei, Antwerpen ",
  "BOURLA SCHOUWBURG, Komedieplaats, Antwerp",
  "Bd Emile de Laveleye 191, 4020 Liège",
  "Rue Méan 27, 4020 Liège",
  "Rue Roture 13, 4020 Liège",
  "50 Bd Voltaire, 75011 Paris, France",
  "120 Blvd Marguerite de Rochechouart, 75018 Paris, France",
  "211 Av. Jean Jaurès, 75019 Paris, France",
  "Brabantlaan 1, 3001 Leuven",
  "Martelarenplein 12, 3000 Leuven",
  "Hurstweg 8, 9000 Gent",
  "Emile Braunplein 39, 9000 Gent",
  "Ancienne Belgique, Boulevard Anspach, Brussels", "16 Villa Gaudelet, Paris"]

User.create(email: "a.a@a.a", password: "123123", iban: Faker::Bank.iban, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_type: 1 )
User.create(email: "b.b@b.b", password: "123123", iban: Faker::Bank.iban, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_type: 2 )
User.create(email: "c.c@c.c", password: "123123", iban: Faker::Bank.iban, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_type: 3 )
User.create(email: "d.d@d.d", password: "123123", iban: Faker::Bank.iban, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_type: 1 )
User.create(email: "e.e@e.e", password: "123123", iban: Faker::Bank.iban, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_type: 2 )
User.create(email: "e.e@e.e", password: "123123", iban: Faker::Bank.iban, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_type: 3 )

# a_file = URI.open('https://res.cloudinary.com/dd9kjgqwb/image/upload/v1645710417/lance-anderson-ni6Vv9tDAjE-unsplash_typujn.jpg')
# b_file = URI.open('https://res.cloudinary.com/dd9kjgqwb/image/upload/v1645710418/valdemaras-d-7VPFyhB_j8Y-unsplash_airyl9.jpg')
# c_file = URI.open('https://res.cloudinary.com/dd9kjgqwb/image/upload/v1645710418/asia-culturecenter-COWf-5ZtZ6w-unsplash_rszyyj.jpg')
# d_file = URI.open('https://res.cloudinary.com/dd9kjgqwb/image/upload/v1645710417/abby-savage-zNsSwsuyP3A-unsplash_ifn8wz.jpg')
# e_file = URI.open('https://res.cloudinary.com/dd9kjgqwb/image/upload/v1645710416/kevin-wolf-BdNtxMj2H4Y-unsplash_n1mwlo.jpg')
# f_file = URI.open('https://res.cloudinary.com/dd9kjgqwb/image/upload/v1645710416/joah-legg-9HDeGTY2dFk-unsplash_wth37m.jpg')

VendingMachine.create!(name: "Studio Zuid",address: addresses.sample,description: Faker::Space.planet, user: User.all.sample)
VendingMachine.create!(name: "Event Lounge",address: addresses.sample,description: Faker::Space.planet, user: User.all.sample)
VendingMachine.create!(name: "The Egg",address: addresses.sample,description: Faker::Space.planet, user: User.all.sample)
VendingMachine.create!(name: "Versailles",address: addresses.sample,description: Faker::Space.planet, user: User.all.sample)
VendingMachine.create!(name: "Studio Noord",address: addresses.sample,description: Faker::Space.planet, user: User.all.sample)
VendingMachine.create!(name: "Skyline Park",address: addresses.sample,description: Faker::Space.planet, user: User.all.sample)

# ('a'..'f').each do |name|
#   name.save
# end

# a.photo.attach(io: a_file, filename: 'studio/zuid.png', content_type: 'image/png')
# a.save
# b.photo.attach(io: b_file, filename: 'event/lounge.png', content_type: 'image/png')
# b.save
# c.photo.attach(io: c_file, filename: 'the/egg.png', content_type: 'image/png')
# c.save
# d.photo.attach(io: d_file, filename: 'versailles.png', content_type: 'image/png')
# d.save
# e.photo.attach(io: e_file, filename: 'studio/noord.png', content_type: 'image/png')
# e.save
# f.photo.attach(io: f_file, filename: 'sky/line/park.png', content_type: 'image/png')
# f.save


Product.create!(category: "snacks", name: "Lays chips 200gr")
Product.create!(category: "snacks", name: "Snickers 50gr")
Product.create!(category: "snacks", name: "M&M pinda 45gr")

Product.create!(category: "drinks", name: "Coca Cola 33cl can")
Product.create!(category: "drinks", name: "Sprite 33cl can")
Product.create!(category: "drinks", name: "Chaudfontaine still water 33cl bottle")
Product.create!(category: "drinks", name: "Aquarius lemon 50cl bottle")

Product.create!(category: "technology", name: "Ninebot Segway ES4 battery charged")
Product.create!(category: "technology", name: "Pure Air Go battery charged")
Product.create!(category: "technology", name: "Matrix E-Bike D8 ProS battery charged")


50.times do
  this_product = Product.all.sample
  if this_product.category == "technology"
    this_price = 90
  else
    this_price = 2
  end
  Item.create!(
    vending_machine: VendingMachine.all.sample,
    capacity: [20, 40, 60, 80].sample,
    quantity: rand(0..20),
    product: this_product,
    list_price: this_price,
    margin: [5, 10, 12, 15, 20].sample
   )
end

3.times do
  start = Date.today + rand(0..2).day
  Booking.create!(
    status: "pending",
    user: refiller1,
    vending_machine: VendingMachine.all.sample
   )
end

15.times do
  start = Date.today + rand(0..2).day
  Booking.create!(
    status: "completed",
    user: refiller1,
    vending_machine: VendingMachine.all.sample
   )
end

# 10.times do Venue.create(
#   name: Faker::Space.planet,
#   price: [750, 1000, 1250, 1500].sample,
#   square_meter: rand(300..1500),
#   location: locations.sample,
#   capacity: rand(100..1200),
#   status: "true", # true = available, false = unavailable
#   image_url: Faker::LoremPixel.image(size: "730x411"),
#   user: User.all.sample
# )
# p "done"
# end
