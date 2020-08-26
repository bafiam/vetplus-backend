module Api
  module V1
    class VetController < ApplicationController
      before_action :vet?
      skip_before_action :vet?, only: [:index]

      def index
        @vet = @current_user.vet
        if @vet
          render json: { status: 'SUCCESS',
                         messages: 'Profile data',
                         profile: VetSerializer.new(@vet) }
        else
          render json: { status: 'FAIL',
                         errors: 'Profile does not exist, create one first' }
        end
      end

      def create
        @vet = Vet.create(first_name: params[:profile][:first_name],
                          second_name: params[:profile][:second_name],
                          tel_number: params[:profile][:tel_number],
                          location: params[:profile][:location],
                          approved_status: params[:profile][:approved_status],
                          vet_number: params[:profile][:vet_number],
                          user: @current_user)
        if @vet.valid?
          render json: { status: 'SUCCESS',
                         messages: 'Profile was successfully created',
                         profile: VetSerializer.new(@vet) }
        else
          render json: { status: 'FAIL', errors: @vet.errors.full_messages }
        end
      end
    end
  end
end
