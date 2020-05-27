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


users = 
    [
    {name: "Coral", username: "coral_fussman", password: "c12345"},
    {name: "Ramon", username: "dark_laughter", password: "r12345"},
    {name: "Emily", username: "emms", password: "e12345"},
    {name: "Greg", username: "super_duper_g", password: "beautiful"},
    {name: "Meg", username: "mwalsh", password: "m12345"}
    ]

puts "Seeding users"
users.each do |user|
  User.create(user)
end 

puts "Seeding boards"
3.times do 
  Board.create(user_id: User.all.sample.id, title: Faker::Food.dish, description: Faker::Food.description)
end


puts "Seeding categories"
cats = Category.create(title: "cats")
beauty = Category.create(title: "beauty")

cat_pictures = Unsplash::Photo.search("cats")
beauty_pictures = Unsplash::Photo.search("beauty")

puts "Seeding images"
puts "Seeding image categories"
cat_pictures.each do |photo|
    image = Image.create(img_url: photo["urls"]["regular"])
    ImageCategory.create(image_id: image.id, category_id: cats.id)
end

beauty_pictures.each do |photo|
  image = Image.create(img_url: photo["urls"]["regular"])
  ImageCategory.create(image_id: image.id, category_id: beauty.id)
end

puts "Seeding board images"
3.times do 
  BoardImage.create(board_id: Board.all.sample.id, image_id: Image.all.sample.id )
end


