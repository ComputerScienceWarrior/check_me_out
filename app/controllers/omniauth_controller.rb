class OmniauthController < ApplicationController

    def facebook
        @user = User.create_from_provider_data(request.env["omniauth.auth"])
        if @user.save
            sign_in_and_redirect @user
        else
            flash[:error] = "An error occured!"
            redirect_to new_user_registration_url
        end
    end

    def github
        @user = User.create_from_provider_data(request.env["omniauth.auth"])
        if @user.save
            sign_in_and_redirect @user
        else
            redirect_to new_user_registration_url
        end
    end

    def google_oauth2
        @user = User.create_from_provider_data(request.env["omniauth.auth"])
        if @user.save!
            sign_in_and_redirect @user
        else
            redirect_to new_user_registration_url
        end
    end
    
    def failure
        flash[:error] = "There was an error signing into the page, please try again later."
        redirect_to new_user_registration_url
    end
end
