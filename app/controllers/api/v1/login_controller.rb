# frozen_string_literal: true

module Api
  module V1
    class LoginController < ApplicationController
      skip_before_action :authorized, only: [:create]
      skip_before_action :verify?, only: [:create]

      def create
        @user = User.find_by(username: user_login_params[:username])
        if @user&.authenticate(user_login_params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { status: 'SUCCESS', message: 'Login Successful', user: UserSerializer.new(@user), jwt: @token }, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      end

      private

      def user_login_params
        params.require(:user).permit(:username, :password)
      end
    end
end
end
