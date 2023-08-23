class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])

        if user
            session[:user.id] = user.id
            render json: user
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    def destroy
        session[:user_id] = nil
        head :no_content
    end
end
