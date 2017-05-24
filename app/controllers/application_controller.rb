class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include PublicActivity::StoreController

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :galleries

  def galleries
  	@galleries = Gallery.order("date DESC")
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :first_name, :last_name, :role, :username, :birthday, :address, :city, :zip, :state, :country, :state, :phone, :school, :work, :hobbies])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:image, :first_name, :last_name, :role, :username, :birthday, :address, :city, :zip, :state, :country, :state, :phone, :school, :work, :hobbies])
  end

end
