require 'rails_helper'

RSpec.describe Api::V1::LoginController, type: :routing do

  describe "login authentication routing" do
    it "routes to api/v1/login to login#create" do
      expect(:post => "api/v1/login").to route_to("api/v1/login#create")
    end
  end
  

end
