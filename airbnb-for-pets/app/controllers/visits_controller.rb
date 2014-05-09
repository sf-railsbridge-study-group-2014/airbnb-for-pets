class VisitsController < ApplicationController
  def create
    redirect_to pets_path
    Visit.create(visitor: current_user, pet: Pet.find(params[:pet_id]))

  end

  def reject
    load_visit.reject!
    redirect_to pets_path
  end

  def accept
    load_visit.accept!
    redirect_to pets_path
  end

  private

  def load_visit()
    current_user.visits.find(params[:id])
  end

end