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
        user = User.find(params[:id])
        user.authentication_token = nil;
        
        render json:{
            status: :ok,
            loggedIn: false,
        }
    end
    
    
end