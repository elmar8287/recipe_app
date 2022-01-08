class GeneralSoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:id])
  end
end
