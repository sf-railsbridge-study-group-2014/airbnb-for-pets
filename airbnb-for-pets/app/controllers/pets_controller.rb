class PetsController < ApplicationController
	def index
		@pets = Pet.all
	end

	def new
		@pet = Pet.new
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def create
		@pet = Pet.new(pet_params)

		respond_to do |format|
			if @pet.save
				format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
				format.json { render action: 'show', status: :created, location: @pet }
			else
				format.html { render action: 'new' }
				format.json { render json: @pet.errors, status: :unprocessable_entity }
			end
		end
	end

	def pet_params
		params.require(:pet).permit(:name, :description)
	end
end
