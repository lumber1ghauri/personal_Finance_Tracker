class ApplicationController < ActionController::Base
  # ✅ Make sure only logged-in accounts can access the app
  before_action :authenticate_account!

  # ✅ Devise custom fields (name, username)
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :username ])
  end

  # ✅ Redirect to dashboard after login/signup
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end
end
