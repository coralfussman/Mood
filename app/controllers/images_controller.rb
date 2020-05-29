class ImagesController < ApplicationController
    before_action :find_image, only: [:show]

    def index
        @images = Image.all
        #@images = Image.search(params[:search])


    end
    
    def show
        @board_image = BoardImage.new
    end

    private
    def image_params
        params.require(:images).permit( :search) 
    end

    def find_image
        @image = Image.find(params[:id])
    end
end
