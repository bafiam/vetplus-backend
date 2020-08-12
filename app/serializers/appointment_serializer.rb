# frozen_string_literal: true

class AppointmentSerializer < ActiveModel::Serializer
  attributes :date, :booking_type, :profile, :vet

  belongs_to :profile
  belongs_to :vet

  
end
