class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #added after devise was installed
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
  	#add your extra model fields here so devise knows theyre clean. Notice you must provide the circumstance
  	#for which these parameters are permitted for
  	devise_parameter_sanitizer.for(:sign_up) << :first_name
  	devise_parameter_sanitizer.for(:sign_up) << :last_name
  	devise_parameter_sanitizer.for(:sign_up) << :address_street
  	devise_parameter_sanitizer.for(:sign_up) << :address_apt
  	devise_parameter_sanitizer.for(:sign_up) << :address_city
  	devise_parameter_sanitizer.for(:sign_up) << :address_state
  	devise_parameter_sanitizer.for(:sign_up) << :address_zip
    devise_parameter_sanitizer.for(:sign_up) << :phone
  	devise_parameter_sanitizer.for(:sign_up) << :avatar

    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :address_street
    devise_parameter_sanitizer.for(:account_update) << :address_apt
    devise_parameter_sanitizer.for(:account_update) << :address_city
    devise_parameter_sanitizer.for(:account_update) << :address_state
    devise_parameter_sanitizer.for(:account_update) << :address_zip
    devise_parameter_sanitizer.for(:account_update) << :phone
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end


end
