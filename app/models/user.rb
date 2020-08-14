class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :user_type, presence: true
  has_one :profile, dependent: :destroy
  has_one :vet, dependent: :destroy
  has_many :appointments
end
