class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_params

  def create
    super
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :birthdate, :phone, :username,
               :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:login, :username, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :birthdate, :phone, :username,
               :email, :password, :password_confirmation, :current_password)
    end
  end
end