module Api
  class UsersController < ApiController
    def me
      render json: @current_user, status: :ok
    end
  end
end