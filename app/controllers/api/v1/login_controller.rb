# frozen_string_literal: true

module Api
  module V1
    class LoginController < ApplicationController
      skip_before_action :authorized, only: [:create]
      skip_before_action :verify?, only: [:create]

      def index
        @user = @current_user
        if @user
          render json: { status: 'SUCCESS', messages: 'User infomatation',
                         user: UserSerializer.new(@user) }
        else
          render json: { status: 'FAIL', errors: 'Please log in again' }
        end
      end

      def create
        @user = User.find_by(username: user_login_params[:username])
        if @user&.authenticate(user_login_params[:password])
          @token = encode_token({ user_id: @user.id })
          render json: { status: 'SUCCESS', messages: 'Login Successful',
                         user: UserSerializer.new(@user), jwt: @token }
        else
          render json: { status: 'FAIL', errors: 'Invalid username or password' }
        end
      end

      private

      def user_login_params
        params.require(:user).permit(:username, :password)
      end
    end
end
end
