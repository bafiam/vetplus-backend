class VetSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :second_name, :tel_number, :location,
             :approved_status, :vet_number
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :username, :email, :user_type
  end
end
