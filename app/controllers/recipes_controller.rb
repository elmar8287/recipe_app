class RecipesController < ApplicationController
    @recipes = Recipe.all
end
