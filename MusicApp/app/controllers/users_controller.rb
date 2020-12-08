class UsersController < ApplicationController
    def new
        # user template to store user inputs into user_params
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # session[:session_token] = @user.reset_session_token!
            # return to this section
            # redirect_to to_what...
        else
            flash.now[:errors] = @user.errors.full_message
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end