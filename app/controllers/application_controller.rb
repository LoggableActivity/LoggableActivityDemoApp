# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ::LoggableActivity::CurrentActor
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!
    return if current_user

    redirect_to root_path, alert: 'You must be signed in to access this page.'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
