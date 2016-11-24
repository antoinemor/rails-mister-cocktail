class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all.map{ |el| el.name }
  end

  def create
    @dose = Dose.new({
      description: params[:dose][:description],
      cocktail_id: params[:cocktail_id],
      ingredient_id: Ingredient.find_by(name: params[:dose][:ingredient]).id
      })
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
