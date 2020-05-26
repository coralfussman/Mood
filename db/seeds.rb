# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying images"

Image.destroy_all

puts "Seeding images"

cat_pictures = Unsplash::Photo.search("cats")
cats = Category.create(title: "cats")

cat_pictures.each do |photo|
    image = Image.create(img_url: photo["urls"]["regular"])
    ImageCategory.create(image_id: image.id, category_id: cats.id)
end



