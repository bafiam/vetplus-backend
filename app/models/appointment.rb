class Appointment < ApplicationRecord
  belongs_to :vet
  belongs_to :profile
  validates :booking_type, presence: true
  validates :date, presence: true
end
