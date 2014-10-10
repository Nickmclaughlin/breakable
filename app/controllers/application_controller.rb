class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :username, :zip, :sex, :admin]
  end

  def admin_authorize!
    if !current_user.admin?
      flash[:warning] = "Invalid request"
      redirect_to root_path
    end
  end
end
