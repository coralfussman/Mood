class Image < ApplicationRecord
    has_many :board_images, dependent: :destroy
    has_many :boards, through: :board_images
    has_many :image_categories, dependent: :destroy
    has_many :categories, through: :image_categories
end
