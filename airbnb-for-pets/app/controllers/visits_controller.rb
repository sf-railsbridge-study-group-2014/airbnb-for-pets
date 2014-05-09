class VisitsController < ApplicationController
  def create
    redirect_to pets_path
    Visit.create(visitor: current_user, pet: Pet.find(params[:pet_id]))

  end

  def reject
    v = current_user.visits.find(params[:id])
    v.reject!
    redirect_to pets_path
  end
end