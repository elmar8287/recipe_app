class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    render 'edit'
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.create(recipe_foods_params)
    flash[:notice] = if @recipe_foods.save
                       'Recipe food successfully added!'
                     else
                       'Food was not added!'
                     end
    redirect_to @recipe
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    flash[:notice] = if @recipe_food.update(params.require(:recipe_food).permit(:food_id, :quantity))
                       'Food was successfully updated!'
                     else
                       'Food was not successfully updated!'
                     end
    redirect_to recipe_path(id: @recipe_food.recipe_id)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:notice] = 'Food was successfully removed from the recipe!'
    redirect_to @recipe
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
