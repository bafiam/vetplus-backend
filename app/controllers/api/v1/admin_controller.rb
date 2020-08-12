module Api
  module V1
    class AdminController < ApplicationController
      def index
        @all_vets = Vet.where(approved_status: 'No')
        if @all_vets
          render json: { status: 'SUCCESS',
                         messages: 'Profile data',
                         profile: @all_vets }
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
