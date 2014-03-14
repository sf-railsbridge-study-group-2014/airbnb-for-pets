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
		if !user_signed_in?
			redirect_to new_user_session_path
		else
			@pet = Pet.new(pet_params)
			@pet.owner = current_user

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
	end

	def pet_params
		params.require(:pet).permit(:name, :description)
	end
end
