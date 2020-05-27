class BoardsController < ApplicationController

    before_action :find_board, only: [:show, :edit, :update, :destroy]

    def index
        @boards = @logged_in_user.boards.all
    end
 
    def new
        @board = Board.new
    end
    
    def create
        @board = @logged_in_user.boards.create(board_params)
        if @board.valid?
           flash[:success] = ["Fresh Slate! Add Images From the Gallery to Begin!"]
           redirect_to board_path(@board)
        else
           flash[:board_error] = board.errors.full_messages
           redirect_to new_board_path
        end 
    end
 
    def edit
    end
    
    def update
        @board.update(board_params)
        redirect_to board_path(@board)
    end
    
    def show
    end
    
    def destroy
        @board.destroy
        redirect_to boards_path
    end

    private
  
    def board_params
        params.require(:board).permit(:title, :description, :user_id)
    end

     def find_board
         @board = Board.find(params[:id])
    end
end
