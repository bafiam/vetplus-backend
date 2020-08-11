# frozen_string_literal: true

class AppointmentSerializer < ActiveModel::Serializer
  attributes :date, :booking_type, :user, :vet
  # attributes :user, :vet

  belongs_to :user
  belongs_to :vet
end
