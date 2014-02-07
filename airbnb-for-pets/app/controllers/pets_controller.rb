class PetsController < ApplicationController
	def index
		@pets = Pet.all
	end

	def new
		@pet = Pet.new
	end

	def create
		@pet = Pet.new(pet_params)
	end
end
