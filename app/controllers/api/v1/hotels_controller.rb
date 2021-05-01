class Api::V1::HotelsController < ApplicationController
  def index
    hotel = Hotel.all
    render json: {
      data: hotel
    }
  end

  def show
    hotel = Hotel.find(params[:id])
    @service = hotel.services
    render json: {
      data: hotel,
      services: @service
    }
  end

  private

  def params_hotel
    params.require(:Hotel).permit(:name, :description, :price, :location, :images)
  end
end
