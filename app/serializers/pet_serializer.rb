class PetSerializer < ActiveModel::Serializer

  belongs_to :user
  attributes :id, :name, :img, :health, :happiness, :age, :weight, :specialty, :hungry, :dirty, :skill_points, :user_id

end
