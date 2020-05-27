# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts "Destroying images"
Image.destroy_all
puts "Destroying users"
User.destroy_all
puts "Destroying boards"
Board.destroy_all
puts "Destroying board images"
BoardImage.destroy_all
puts "Destroying categories"
Category.destroy_all
ImageCategory.destroy_all

puts "Seeding boards"
3.times do 
  Board.create(user_id: User.all.sample.id, title: Faker::Food.dish, description: Faker::Food.description)
end


puts "Seeding categories"
beauty = Category.create(title: "beauty")
art = Category.create(title: "art")
fashion = Category.create(title: "fashion")
color = Category.create(title: "color")
food = Category.create(title: "food")
animals = Category.create(title: "animals")
home = Category.create(title: "home")

beauty_pictures = Unsplash::Photo.search("beauty")
art_pictures = Unsplash::Photo.search("art")
fashion_pictures = Unsplash::Photo.search("fashion")
color_pictures = Unsplash::Photo.search("color")
food_pictures = Unsplash::Photo.search("food")
animal_pictures = Unsplash::Photo.search("animals")
home_pictures = Unsplash::Photo.search("home")

puts "Seeding images"
puts "Seeding image categories"
beauty_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: beauty.id)
end

art_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: art.id)
end

fashion_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: fashion.id)
end

color_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: color.id)
end

food_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: food.id)
end

animal_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: animals.id)
end

home_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: home.id)
end

puts "Seeding board images"
30.times do 
  BoardImage.create(board_id: Board.all.sample.id, image_id: Image.all.sample.id )
end


