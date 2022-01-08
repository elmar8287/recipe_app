class RecipeFoodsController < ApplicationController
    def new
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = @recipe.recipe_foods.new
    end
end
