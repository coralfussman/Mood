class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorized, only: [:new, :create]

    def new
    @user = User.new
    end
    
    def create
        user = User.create(user_params)
        if user.valid?
           flash[:success] = ["Welcome! you're all set!"]
           session[:user_id] = user.id
           redirect_to boards_path(user)
        else
           flash[:user_error] = user.errors.full_messages
           redirect_to new_user_path
        end 
    end

    
    def edit
    end
    
    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end
    
    def show
        redirect_to boards_path
    end
    
    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

     def find_user
         @user = User.find(params[:id])
    end
end
