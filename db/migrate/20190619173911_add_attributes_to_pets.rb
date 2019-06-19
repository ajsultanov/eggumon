class AddAttributesToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :health, :integer
    add_column :pets, :happiness, :integer
    add_column :pets, :age, :string
    add_column :pets, :weight, :integer
    add_column :pets, :specialty, :string
    add_column :pets, :hungry, :boolean
    add_column :pets, :dirty, :boolean
    add_column :pets, :skill_points, :integer
  end
end
