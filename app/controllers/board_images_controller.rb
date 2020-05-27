class BoardImagesController < ApplicationController
    before_action :find_board_image, only: :destroy

    validates :image_id, uniqueness: {scope: :board_id}
        
    def destroy
        @board_image.destroy
        redirect_back(fallback_location: boards_path)
    end
    
    private

    def find_board_image
        @board_image = BoardImage.find(params[:id])
    end
end
