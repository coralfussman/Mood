class BoardImage < ApplicationRecord
  belongs_to :board
  belongs_to :image

  validates :image_id, uniqueness: {scope: :board_id}
  
end
