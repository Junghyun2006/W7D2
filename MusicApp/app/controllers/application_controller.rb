class ApplicationController < ActionController::Base
    helper_method :current_user, :current_user_id, :logged_in?
    
    def current_user
        # only run if session[:session_token] exists
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def current_user_id
        current_user ? current_user.id : nil
    end
    
    def logged_in?
        # returns boolean for truth-y and false-y user instance
        !!current_user
    end

    # logging in the user
    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    # def ensure_logged_in
    #     redirect_to new_session_url if current_user.nil?
    # end
end