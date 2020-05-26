class Image < ApplicationRecord
    has_many :board_images
    has_many :boards, through: :board_images
    has_many :image_categories
    has_many :categories, through: :image_categories
end
