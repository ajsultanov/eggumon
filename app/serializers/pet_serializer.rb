class PetSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :name, :img
end
