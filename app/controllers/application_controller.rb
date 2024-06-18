class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
        if session[:user_id]
         @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    helper_method :logged_in?
    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
