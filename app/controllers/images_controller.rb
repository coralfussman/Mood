class ImagesController < ApplicationController
    before_action :find_image, only: [:show]

    def index
        @images = Image.all
        #@images = Image.search(params[:search])
    end
    
    def show
        @board_image = BoardImage.new
        @my_boards = @logged_in_user.boards.all
    end

    private
    def image_params
        params.require(:images).permit( :search) 
    end

    def find_image
        @image = Image.find(params[:id])
    end
end
