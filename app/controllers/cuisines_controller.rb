class CuisinesController < ApplicationController
  # load_and_authorize_resource
  
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = @restaurant.fooditems
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = @restaurant.cuisines.build(cuisine_params)
    if @cuisine.save
      redirect_to restaurant_cuisines_path(@restaurant), notice: "Cuisine created"
    else
      render :new
    end
  end

  def new
    @cuisine = Cuisine.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def show
    @cuisine = Cuisine.find_by(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = @restaurant.cuisines.update(cuisine_params)
    if @restaurant.cuisines.update(cuisine_params)
      redirect_to restaurant_cuisines_path(@restaurant), notice: "Cuisine updated"
    else
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = @restaurant.cuisines.find(params[:id])
    @cuisine.destroy
    redirect_to restaurant_cuisines_path, notice: "cuisine deleted"
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
