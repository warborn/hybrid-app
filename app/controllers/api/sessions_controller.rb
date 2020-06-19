module Api
  class SessionsController < Devise::SessionsController
    respond_to :json

    protected

    def auth_options
      super.merge(store: !request.format.json?, scope: :api_user)
    end

    private

    def respond_with(resource, _opts = {})
      render json: resource
    end

    def respond_to_on_destroy
      head :no_content
    end
  end
end