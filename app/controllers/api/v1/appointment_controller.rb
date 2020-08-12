# frozen_string_literal: true

module Api
  module V1
    class AppointmentController < ApplicationController
      def index
        @appointment = Vet.where(approved_status: 'Yes')
        if @appointment
          render json: { status: 'SUCCESS',
                         messages: 'Vets data',
                         profile: @appointment }
        else
          render json: { status: 'FAIL',
                         errors: 'No vets in the system' }
        end
      end

      def create
        if Appointment.where(date: params[:appointment][:date],
                             vet_id: params[:appointment][:vet],
                             booking_type: params[:appointment][:booking_type],
                             profile: @current_user.profile).exists?
          render json: { status: 'FAIL', errors: 'Dublication detected' }
        else

          @appointment = Appointment.create(
            date: params[:appointment][:date],
            vet_id: params[:appointment][:vet],
            booking_type: params[:appointment][:booking_type],
            profile: @current_user.profile
          )
          if @appointment.valid?
            render json: { status: 'SUCCESS',
                           messages: 'Appointment was successfully created' }
          else
            render json: { status: 'FAIL', errors: @appointment.errors.full_messages }
          end
        end
      end
    end
  end
end
