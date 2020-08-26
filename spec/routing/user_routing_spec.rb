require 'rails_helper'

RSpec.describe Api::V1::UserController, type: :routing do
  describe 'authentication routing' do
    it 'routes to api/v1/user to user#create' do
      expect(post: 'api/v1/user').to route_to('api/v1/user#create')
    end
  end
end
