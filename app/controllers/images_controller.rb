class ImagesController < ApplicationController
    before_action :find_image, only: :show

    def index
        @images = Image.all
    end
    
    def show
    end

    private
    
    def find_image
        @image = Image.find(params[:id])
    end
end
