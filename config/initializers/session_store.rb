# persists the session
Rails.application.config.session_store :active_record_store, key: '_devise_omniauth_session'