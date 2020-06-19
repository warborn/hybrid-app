module Api
  class UsersController < ApiController
    def me
      puts "*****CURRENT USER: ", @current_user
      render json: @current_user, status: :ok
    end
  end
end