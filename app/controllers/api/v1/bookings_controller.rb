class Api::V1::BookingsController < ApplicationController

    def index
        booking = Booking.all

        render json: {
            data: booking,
            status: :ok
        }
    end
    
    def show
        booking = Booking.find(params[:id])
        user = booking.user
        hotel = booking.hotel

        render json: {
            data: booking,
            hotels: hotel,
            users: user,
            status: :ok
        }


    end
  

    def create
     booking = Booking.new(booking_params)
     if booking.save
        render json:{
            data: booking,
            status: :created
        }  
     else
        render json:{
            status: :unprocessable_entity
        }  
     end
    end


    private

    def booking_params
        params.require(:booking).permit(:arrival, :departure, :room, :guest, :hotel_id, :user_id)
    end
    
    

end
