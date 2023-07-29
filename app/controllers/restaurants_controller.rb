class RestaurantsController < ApplicationController
#  authorize_resource
 #before_action :authenticate_user!,only: [:edit,:update,:destroy]
 before_action :set_restaurant_id,only: %i[show edit update destroy]
 
  def index
    @restaurants = Restaurant.all.paginate(page: params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
     redirect_to restaurants_path, notice: "Restaurant created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(params_restaurant)
      redirect_to restaurants_path, notice: "Restaurant updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurant_path, notice: "Restaurant deleted successfully"
  end
  
  def set_restaurant_id
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def params_restaurant
    params.require(:restaurant).permit(:name, :description, :address)
  end
end
