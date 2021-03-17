class Api::V1::HotelsController < ApplicationController

    def index
        hotel = Hotel.all

        render json: {

              data: hotel,
              status: :ok

           }

    end

    def show

        hotel = Hotel.find( params[:id] )

        render json: {

              data: hotel,
            #   images: @avatars,
              status: :ok

           }
        
    end
    

    private
    def params_hotel

    params.require(:Hotel).permit(:name, :description, :price, :location, :images)
        
    end

end
