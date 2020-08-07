
module Api
  module V1
    class LogoutController < ApplicationController
      
      def index
        @done_token = Blacklist.create(token: @token)
        if @done_token.valid?
          render json: { status: 'SUCCESS', messages: 'Logout successful' }
        end
      end

      
    end

end
end
