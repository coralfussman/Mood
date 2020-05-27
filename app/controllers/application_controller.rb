class ApplicationController < ActionController::Base
    before_action :set_user
    before_action :authorized

    def set_user
        @logged_in_user = User.find_by(id: session[:user_id])
    end

    def authorized
        if @logged_in_user
        else
            flash[:errors] = ["You must login first"]
            redirect_to home_page_path
        end
    end
end
