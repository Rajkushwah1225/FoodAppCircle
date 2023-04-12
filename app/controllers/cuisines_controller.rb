class CuisinesController < ApplicationController
  
  # def index
  #   @cuisines = Cuisine.all
  #   # if params[:search].present?
  #     #   @cuisines = Cuisine.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
  #     # else
  #     #   Cuisine.all
  #     # end
  # end
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = @restaurant.cuisines.paginate(page: params[:page])
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
    @cuisine = @restaurant.cuisines.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cuisine = Cuisine.find(params[:id])
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])
    @cuisine.destroy
    redirect_to cuisine_path, notice: "cuisine deleted"
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end