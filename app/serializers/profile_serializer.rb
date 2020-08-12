class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :second_name, :tel_number, :location
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :username, :email, :user_type
  end
end
