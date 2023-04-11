class CuisineController < ApplicationController
  def index
    @cuisines = Cuisine.all
    # if params[:search].present?
      #   @restaurants = Cuisine.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      # else
      #   Cuisine.all
      # end
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

  def edit
  end

  # def search
  #  if params[:search].present?
  #   @restaurants = @restaurants.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
  # end

  # def search
  #    cuisines = @cuisines.where(type: params[:id])
  # end
  private

  def cuisine_params
    params.require(:cuisine).permit(:name, :restaurant_id)
  end
end
