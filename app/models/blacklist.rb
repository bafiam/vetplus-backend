class Blacklist < ApplicationRecord
  validates :token,  presence: true, uniqueness: { case_sensitive: false }
end
