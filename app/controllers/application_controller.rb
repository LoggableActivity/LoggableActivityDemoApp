# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # include LoggableActivity::CurrentUser
  before_action :set_current_user
  after_action :clear_current_user

  def authenticate_user!
    return if current_user

    redirect_to root_path, alert: 'You must be signed in to access this page.'
  end

  private

  def set_current_user
    # return if request.path == "/users/sign_out"
    return unless current_user

    Thread.current[:current_user] = current_user
  end

  def clear_current_user
    Thread.current[:current_user] = nil
  end
end
