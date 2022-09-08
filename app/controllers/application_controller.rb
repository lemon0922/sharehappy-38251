class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(_resource)
    events_path
  end

  def after_sign_in_path_for(_resource)
    events_path
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'lemon' && password == '0000'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
