class DosesController < ApplicationController
  before_action :find_cocktail
  before_action :find_ingredient

  def new
  end

  def create
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:ingredient_id])
  end
end
