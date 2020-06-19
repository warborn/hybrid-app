module Api
  class ApiController < ActionController::API
    include ActionController::MimeResponds
    before_action :authenticate_api_user!
    before_action :set_current_user

    def set_current_user
      @current_user ||= warden.authenticate(scope: :api_user)
    end
  end
end