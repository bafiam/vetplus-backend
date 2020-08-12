module Api
  module V1
    class PatientController < ApplicationController
      def index
        user_profile = @current_user.profile
        appointments_u = Appointment.order(date: :desc).where(profile: user_profile)
        if appointments_u
          render json: { status: 'SUCCESS',
                         messages: 'User appointments',
                         profile: ActiveModel::SerializableResource.new(
                           appointments_u,
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
# user
