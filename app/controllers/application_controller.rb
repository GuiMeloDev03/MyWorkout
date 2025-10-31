class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a realizar esta ação."
    redirect_back(fallback_location: root_path)
  end
end
