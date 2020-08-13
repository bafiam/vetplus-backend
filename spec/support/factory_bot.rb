require 'factory_bot'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  FactoryBot.define do
    factory :user do
      email { "John@gmail.com" }
      username  { "Doe" }
      password { "123456789" }
      user_type { "vet" }
    end
  end

end
