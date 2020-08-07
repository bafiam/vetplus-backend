class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :user_type, presence: true
  has_one :profile, dependent: :destroy
  has_one :vet, dependent: :destroy
end
