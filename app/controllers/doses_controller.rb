class DosesController < ApplicationController
  before_action :find_dose, only: [:destroy]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all.map{ |el| el.name }
  end

  def create
    @dose = Dose.new({
      description: params['dose']['description'],
      cocktail_id: params['cocktail_id'],
      ingredient_id: Ingredient.find_by(name: params['dose']['ingredient']).id
      })
    @dose.save
    redirect_to cocktail(params['cocktail_id'])
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(params['cocktail_id'])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

end
