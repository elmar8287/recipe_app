class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def public_recipes
    @recipes = Recipe.where({ public: true }).order(created_at: :desc)
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    flash[:notice] = 'Recipe successfully added!' if @recipe.save
    redirect_to recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @recipe.destroy
    flash[:notice] = 'Recipe successfully deleted!'
    redirect_back(fallback_location: root_path)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
