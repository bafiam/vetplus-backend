class Profile < ApplicationRecord
  validates :location, presence: true
  validates :tel_number, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
