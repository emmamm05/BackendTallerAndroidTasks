class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Skip Authenticity token
  skip_before_action :verify_authenticity_token

  respond_to :json

end
