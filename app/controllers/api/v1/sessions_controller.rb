class Api::V1::SessionsController < ApplicationController
  def create
    if (user = User.find_by_email(params[:email])) && user.valid_password?(params[:password])

      render json: {
        data: user
      }

    else
      head(:unauthorized)
    end

    def sessions_params
       params.require(:user).permit(:email, :password)
    end
  end
end
