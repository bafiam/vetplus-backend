module Api
  module V1
    class LogoutController < ApplicationController
      def index
        @done_token = Blacklist.create(token: @token)
        render json: { status: 'SUCCESS', messages: 'Logout successful' } if @done_token.valid?
      end
    end
  end
end
