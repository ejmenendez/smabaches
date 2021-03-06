class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  # en caso que haya excepciones con las autorizaciones de las distintas acciones
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
		flash.now[:alert] = "No esta autorizado para realizar esta accion"
		redirect_to(request.referrer || root_path)
  end

end
