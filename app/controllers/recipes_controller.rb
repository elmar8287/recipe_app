class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.where(id: params[:id]).includes(:recipe_foods).take
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(params.require(:recipe).permit(:public))
  end

  def public_recipes
    @recipes = Recipe.where({ public: true }).order(created_at: :desc).includes(:user)
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
