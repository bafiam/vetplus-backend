module Api
  module V1
    class UserController < ApplicationController
      skip_before_action :authorized, only: [:create]
      skip_before_action :verify?, only: [:create]

      def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { status: 'SUCCESS', message: 'Account created', user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    
      private
    
      def user_params
        params.require(:user).permit(:email,:username, :password, :password_confirmation, :user_type)
      end

    end
end
end
