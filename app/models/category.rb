class Category < ApplicationRecord
    has_many :image_categories, dependent: :destroy
    has_many :images, through: :image_categories

    def self.search(search)
        if search
          matching_imgs = Image.find_by(category: search)
            if matching_imgs
                self.where(image_id: matching_imgs)
            else
                @image = Image.all
            end
        else
          @image = Image.all
        end
    end
end
