class Vet < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, uniqueness: { case_sensitive: false }
  has_many :appointments
end
