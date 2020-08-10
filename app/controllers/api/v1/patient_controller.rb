module Api
  module V1
    class PatientController < ApplicationController
      def index
        @appointments_u = Appointment.where(user_id: @current_user)
        if @appointments_u
          render json: { status: 'SUCCESS',
                         messages: 'User appointments',
                         profile: @appointments_u }
        else
          render json: { status: 'FAIL',
                         errors: 'No recorded appointments in the system' }
        end
      end
    end
  end
end
# user