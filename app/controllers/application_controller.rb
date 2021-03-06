class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  # only asks for authorization unless devise controller, admin, index, my_rest, my_books
  after_action :verify_authorized, except: [:index, :my_restaurants, :my_bookings], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :my_restaurants, :my_bookings], unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def skip_pundit?
    # checks if it's a devise controller or an admin
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
