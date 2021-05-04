# rubocop:disable Style/GuardClause, Layout/IndentationWidth
class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
    render json: {
      data: user,
      status: 201
    }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
# rubocop:enable Style/GuardClause, Layout/IndentationWidth
