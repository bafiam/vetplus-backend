
module Api
  module V1
    class LogoutController < ApplicationController
      def create
        done_token = Blacklist.create(token: @token)
        if done_token.valid?
          render json: { status: 'SUCCESS', messages: 'Logout successful' }
        else
          render json: { status: 'FAIL', errors: done_token.errors.full_messages }
        end
      end
    end
end
end
