class RestaurantsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!, only: %i[edit update destroy]

  def index
    @restaurants = Restaurant.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to restaurants_path, notice: 'Restaurant created successfully'
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(params[:id])
    if @restaurant.update(params_restaurant)
      redirect_to restaurants_path, notice: 'Restaurant updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurant_path, notice: 'Restaurant deleted successfully'
  end

  private

  def params_restaurant
    params.require(:restaurant).permit(:name, :description, :address)
  end
end
