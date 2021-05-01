# rubocop:disable Style/GuardClause
class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
    render json: {
        data: user
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
# rubocop:enable Style/GuardClause
