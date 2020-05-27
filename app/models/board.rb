class Board < ApplicationRecord
  belongs_to :user
  has_many :board_images, dependent: :destroy
  has_many :images, through: :board_images

  validates :title, presence: true
end
