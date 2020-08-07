# frozen_string_literal: true

module Api
  module V1
    class ProfileController < ApplicationController
      before_action :profile?
      skip_before_action :profile?, only: [:index]
      def index
        @profile = @current_user.profile
        if @profile
          render json: { status: 'SUCCESS',
          messages: 'Profile data',
          profile: ProfileSerializer.new(@profile) }
        else
          render json: { status: 'FAIL', errors: "Profile does not exist, create one first"}
        end
      end

      def create
        @profile = Profile.create(first_name: params[:profile][:first_name],
                                  second_name: params[:profile][:second_name],
                                  tel_number: params[:profile][:tel_number],
                                  location: params[:profile][:location],
                                  user: @current_user)
        if @profile.valid?
          render json: { status: 'SUCCESS',
                         messages: 'Profile was successfully created',
                         profile: ProfileSerializer.new(@profile) }
        else
          render json: { status: 'FAIL', errors: @profile.errors.full_messages }
        end
      end

      
    end
end
end
