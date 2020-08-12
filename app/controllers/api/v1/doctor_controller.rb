module Api
  module V1
    class DoctorController < ApplicationController
      def index
        get_vet = @current_user.vet
        appointments = Appointment.where(vet: get_vet)
        if appointments
          render json: { status: 'SUCCESS',
                         messages: 'Vets appointments',
                         profile: ActiveModel::SerializableResource.new(
                           appointments,
                           each_serializer: AppointmentSerializer
                         ).as_json }

        else
          render json: { status: 'FAIL',
                         errors: 'No recorded appointments in the system' }
        end
      end
    end
  end
end
