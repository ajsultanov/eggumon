class Api::V1::PetsController < ApplicationController
  before_action :find_pet, only: [:update, :show]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def update
    @pet.update(pet_params)
    if @pet.save
      render json: @pet,
      status: :accepted
    else
      render json: { errors: @pet.errors.full_messages },
      status: :unprocessible_entity
    end
  end

  def show
    render json: @pet
  end

  private

  def pet_params
    params.permit(:id, :name, :img, :health, :happiness, :age, :weight, :specialty, :hungry, :dirty, :skill_points)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
