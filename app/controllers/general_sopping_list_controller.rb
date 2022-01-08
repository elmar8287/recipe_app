class GeneralSoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:id])
    @total = @recipe.recipe_foods.map(&:total_price).sum
  end
end
