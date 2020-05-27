class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new_login, :login]

    def new_login
    end

    def login
        user = User.find_by(username: session_params[:username])

        if user && user.authenticate(session_params[:password]) 
            flash[:success] = "Welcome!"
            session[:user_id] = user.id 
            redirect_to user
        else 
            flash[:error] = 'Something did not match'
            redirect_to new_login_path
        end 
    end

    def logout
        session[:user_id] = nil
        redirect_to home_page_path
    end

    private

    def session_params
        params.require(:session).permit(:username, :password)
    end

end