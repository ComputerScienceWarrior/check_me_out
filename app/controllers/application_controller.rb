class ApplicationController < ActionController::Base
    # only run the before filter if we receive a devise_controller...(special devise helper method)
    before_action :configure_permitted_params, if: :devise_controller?

    def configure_permitted_params
        # Additional params to sanitize and allow during signup and edit
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
