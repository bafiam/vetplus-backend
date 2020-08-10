
module Api
  module V1
    class DoctorController < ApplicationController
      def index
        @appointments = Appointment.where(vet_id: @current_user)
        if @appointments
          render json: { status: 'SUCCESS',
                         messages: 'Vets appointments',
                         profile: @appointments }
        else
          render json: { status: 'FAIL',
                         errors: 'No recorded appointments in the system' }
        end
      end
    end
end
end
# vet