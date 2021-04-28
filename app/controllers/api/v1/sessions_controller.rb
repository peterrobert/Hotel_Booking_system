class Api::V1::SessionsController < ApplicationController
  def create
    if (user = User.find_by_email(params[:email])) && user.valid_password?(params[:password])

      render json: {
        data: user,
        status: :created,
      }

    else
      head(:unauthorized)
    end
  end

  def destroy
    user = User.find(params[:id])
    user.authentication_token = nil
    if user.save
      render json: {
        status: :ok,
      }
    else
      render json: {
        status: :unprocessable_entity
      }

    end
  end
end
