class UserSerializer < ActiveModel::Serializer
  attributes :id :username, :token

  has_one :profile
end
