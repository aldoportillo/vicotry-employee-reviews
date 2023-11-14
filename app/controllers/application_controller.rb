class ApplicationController < ActionController::Base
  skip_forgery_protection
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit::Authorization

  private
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      
      redirect_back fallback_location: root_url
    end
end
