class Api::V1::SessionsController < ApplicationController

    def create
        if (user = User.find_by_email(params[:email])) && user.valid_password?(params[:password])

            render json:{
                data: user,
                status: :created,
                loggedIn: true,
            }
            
        else
            head(:unauthorized)
        end
        
    end


    def destroy
        user = @current_user
        user.authentication_token = nil;
        if  user.save 
            render json:{
                status: :ok,
                loggedIn: false,
            }
        else
            render json:{
                status: :unprocessable_entity
            }
            
        end

    end

    private

    def authenticate
        authenticate_or_request_with_http_token do |token, _options|
         @current_user = User.find_by(authentication_token: token)
        end
   end
  
        
    
end
