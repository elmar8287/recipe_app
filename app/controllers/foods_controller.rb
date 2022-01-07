class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      flash[:notice] = 'Food successfully added!'
      redirect_to foods_path
    else
      flash[:notice] = 'Food was not added, please fill all the fileds!'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    authorize! :destroy, @food
    @food.destroy
    flash[:notice] = 'Food susseccfully deleted!'
    redirect_back(fallback_location: foods_path)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_units, :price)
  end
end
