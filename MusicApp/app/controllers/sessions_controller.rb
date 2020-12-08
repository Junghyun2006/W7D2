class SessionsController < ApplicationController
    def new
        render :new
    end

    # logging in means session[:session_token] == user.session_token
    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        
        if user
            session[:session_token] = user.reset_session_token!
            redirect_to user_url(user)
        else
            flash.now[:errors] = user.errors.full_messages
            render :new
        end
    end

    # logging out means session[:session_token] != user.session_token
    def destroy
        @current_user.reset_session_token!
        session[:session_token] = nil
        render :new
    end
end