class Profile < ApplicationRecord
  validates :location, presence: true
  validates :tel_number, presence: true
  validates :user_id, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :user
end
 