class Image < ApplicationRecord
    has_many :board_images, dependent: :destroy
    has_many :boards, through: :board_images
    has_many :image_categories, dependent: :destroy
    has_many :categories, through: :image_categories

    def self.search(search)
        category = Category.find_by(title: search)
        if category
            ic = ImageCategory.where(category_id: category.id)

            @images = []
            ic.each do |ic|
                @images << Image.where(id: ic.image_id)
            end

            @images
        end
    end

end
