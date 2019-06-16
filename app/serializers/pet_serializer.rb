class PetSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :name
end
