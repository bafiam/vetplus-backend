# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :vet
  validates :booking_type, presence: true
  validates :date, presence: true
end
