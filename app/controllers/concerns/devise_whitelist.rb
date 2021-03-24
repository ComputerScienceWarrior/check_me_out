module DeviseWhitelist
    extend ActiveSupport::Concern

    included do
        before_action :configure_permitted_params, if: :devise_controller?
    end

    def configure_permitted_params
        # Additional params to sanitize and allow during signup and edit
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
    end
end