class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :delivery_address, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password], except: [:email])
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password)}
  end

  # include Pundit

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end
end

# include Pundit

# # Pundit: white-list approach.
# after_action :verify_authorized, except: :index, unless: :skip_pundit?
# after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

# # Uncomment when you *really understand* Pundit!
# # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
# # def user_not_authorized
# #   flash[:alert] = "You are not authorized to perform this action."
# #   redirect_to(root_path)
# # end

# private

# def skip_pundit?
#   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
# end
