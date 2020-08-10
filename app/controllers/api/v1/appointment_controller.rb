# frozen_string_literal: true

module Api
  module V1
    class AppointmentController < ApplicationController
      def index
        @appointment = Vet.where(approved_status:'Yes')
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
        @appointment = Appointment.create(
          date: params[:appointment][:date],
          vet_id: params[:appointment][:vet],
          type: params[:appointment][:type],
          user: @current_user
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
