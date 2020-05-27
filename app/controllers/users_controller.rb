class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :find]
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
           flash[:errors] = user.errors.full_messages
           redirect_to new_user_path
        end 
    end

    
    def edit
    end
    
    def update
        @user.update(user_params)
        redirect_to account_path
    end
    
    def show
        redirect_to boards_path
    end
    
    def destroy
        @logged_in_user.destroy
        flash[:success] = ["Your account has been deleted"]
        redirect_to home_page_path
    end

    def account
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

     def find_user
         @user = User.find(params[:id])
    end
end
