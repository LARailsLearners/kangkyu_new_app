class ApplicationController < ActionController::Base

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_url, alert: "not authorized as admin user!"
    end
  end

  private

  def user_not_authorized
    # flash[:alert] = "You are not authorized to perform this action."
    redirect_to request.referrer || root_path, alert: "not your product!"
  end

  # # authorization
  # def created_by_current_user?(product)
  #   product.user && current_user == product.user
  # end
  # helper_method :created_by_current_user?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation) }
  end

end
