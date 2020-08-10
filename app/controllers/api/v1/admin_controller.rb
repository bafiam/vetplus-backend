# frozen_string_literal: true

module Api
  module V1
    class AdminController < ApplicationController
      def index
        @allVets = Vet.where(approved_status:'No')
        if @allVets
          render json: { status: 'SUCCESS',
                         messages: 'Profile data',
                         profile: @allVets }
        else
          render json: { status: 'FAIL',
                         errors: 'No unapproved profile at this time' }
        end
      end
 

      def update
        @get_vet = Vet.find(params[:status][:id])
        @get_vet.update_attributes(approved_status: 'Yes')
        render json: { status: 'SUCCESS',
                       messages: 'Vets approved' }
      end
    end
  end
end
