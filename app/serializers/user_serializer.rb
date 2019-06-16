class UserSerializer < ActiveModel::Serializer
  has_many :pets
  attributes :name
end
