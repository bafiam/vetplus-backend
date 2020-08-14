require 'factory_bot'
require 'faker'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      username { Faker::Name.unique.name }
      password { '123456789' }
      user_type { 'vet' }
    end

    factory :vet do
      user
      first_name { Faker::Name.name }
      second_name { Faker::Name.name }
      avatar { Faker::Avatar }
      tel_number { Faker::Number }
      location { Faker::Address }
      vet_number { Faker::Number }
      approved_status { 'Yes' }
    end

    factory :profile do
      user
      first_name { Faker::Name.name }
      second_name { Faker::Name.name }
      avatar { Faker::Avatar }
      tel_number { Faker::Number }
      location { Faker::Address }
    end
    factory :appointment do
      vet
      profile
      booking_type { 'video clinic' }
      date { Faker::Date }
    end
  end
end
