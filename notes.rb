! # Devise

# skip_before_action :authenticate_user!, only: :index

# To verify if a user is signed in, use the following helper:
# user_signed_in?

# For the current signed-in user, this helper is available:
# current_user

# You can access the session for this scope:
# user_session

# What if I want to add a first_name and last_name at sign up?

# class ApplicationController < ActionController::Base
#   # [...]
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   def configure_permitted_parameters
#     # For additional fields in app/views/devise/registrations/new.html.erb
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

#     # For additional in app/views/devise/registrations/edit.html.erb
#     devise_parameter_sanitizer.permit(:account_update, keys: [:username])
#   end
# end
