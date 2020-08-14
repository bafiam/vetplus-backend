class Vet < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_many :appointments
end
