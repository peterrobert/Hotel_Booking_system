class Api::V1::BookingsController < ApplicationController
    before_action :authenticate

    def index
        booking = @current_user.bookings
        all_booking = booking.all

        hotel = @current_user.hotels
        all_hotel = hotel.all

        render json: {
            data:  all_booking,
            hotel: all_hotel,
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

    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
       @current_user = User.find_by(authentication_token: token)
      end
    end

    
    

end
