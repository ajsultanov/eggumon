class Api::V1::PetsController < ApplicationController
  before_action :find_pet, only: [:update, :show]
  before_action :find_user, only: [:create]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def create
    @pet = Pet.new
    @pet.name = pet_params[:name]
    @pet.img = "egg.png"
    @pet.health = 3
    @pet.happiness = 3
    @pet.skill_points = 0
    @pet.age = "egg"
    @pet.weight = 1
    @pet.specialty = pet_params[:specialty]
    @pet.hungry = true
    @pet.dirty = false
    @pet.user = @user

    if @pet.save
      render json: @pet, status: :accepted
    else
      render json: { errors: @pet.errors.full_messages }, status: :unprocessible_entity
    end
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
    params.permit(:id, :name, :img, :health, :happiness, :age, :weight, :specialty, :hungry, :dirty, :skill_points, :user)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user])
  end
end
