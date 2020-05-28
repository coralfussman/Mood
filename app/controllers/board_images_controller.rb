class BoardImagesController < ApplicationController
    before_action :find_board_image, only: :destroy

    def new
        #@board_image = BoardImage.new
        redirect_to image_path(@image.id)
    end

    def create
        board_image = BoardImage.create(board_image_params)
        if board_image.valid?
           
           redirect_to board_path(board_image.board.id)
        else
           flash[:board_image_error] = board_image.errors.full_messages
           redirect_to board_path(board_image.board.id)
        end 
    end
        
    def destroy
        @board_image.destroy
        redirect_back(fallback_location: boards_path)
    end
    
    private
    def board_image_params
        params.require(:board_image).permit(:board_id, :user_id)
    end

    def find_board_image
        @board_image = BoardImage.find(params[:id])
    end
end
