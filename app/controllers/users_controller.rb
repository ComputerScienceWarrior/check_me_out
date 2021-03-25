class UsersController < ApplicationController
    before_action :find_user, only: [:index, :show]

    def index
        @users = User.all
    end

    def show
    end

    def destroy
        @user.portfolios.destroy_all
        @user.blogs.destroy_all
        @user.destroy
        reset_session
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
