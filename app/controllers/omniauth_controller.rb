class OmniauthController < Devise::OmniauthCallbacksController

    # future facebook implementation below
    # def facebook
    #     @user = User.create_from_provider_data(request.env["omniauth.auth"])
    #     if @user.save
    #         redirect_to user_path(@user)
    #     else
    #         flash[:error] = "An error occured!"
    #         redirect_to new_user_registration_url
    #     end
    # end

    def github
        @user = User.create_from_provider_data(request.env["omniauth.auth"])
        sign_in(:user, @user)
        if @user.save
            redirect_to user_path(@user)
        else
            redirect_to new_user_registration_url
        end
    end

    def google_oauth2
        @user = User.create_from_provider_data(request.env["omniauth.auth"])
        sign_in(:user, @user)
        if @user.save
            redirect_to user_path(@user)
        else
            redirect_to new_user_registration_url
        end
    end
    
    def failure
        flash[:error] = "There was an error signing into the page, please try again later."
        redirect_to new_user_registration_url
    end
end
