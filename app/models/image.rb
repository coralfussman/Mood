class Image < ApplicationRecord
    has_many :board_images, dependent: :destroy
    has_many :boards, through: :board_images
    has_many :image_categories, dependent: :destroy
    has_many :categories, through: :image_categories

    def self.search(search)
        category = Category.find_by(title: search)
        if category
            ic = ImageCategory.find_by(category_id: category.id)
            self.where(id: ic.image_id)
        end
    end

end
