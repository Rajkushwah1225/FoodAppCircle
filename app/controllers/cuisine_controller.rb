class CuisineController < ApplicationController
   def index
   end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = @restaurant.cuisines.build
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = @restaurant.cuisines.build(cuisine_params)
    if @cuisine.save
      redirect_to @restaurant, notice: "Cuisine added successfully"
    else
      render :new
    end
  end
  
  private
  
  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
