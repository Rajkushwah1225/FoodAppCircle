class FooditemsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fooditem = @restaurant.fooditems
  end

  def show
    @fooditem = Fooditem.find(params[:id])
  end

  def new
    @fooditem = Fooditem.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fooditem =  @restaurant.fooditems.build(params_fooditem)
    if @fooditem.save
      redirect_to new_restaurant_fooditem_path   
     else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fooditem = Fooditem.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fooditem =  @restaurant.fooditems.update(params_fooditem)
    if @restaurant.fooditems.update(params_fooditem)
      redirect_to request.referer, notice: "fooditems updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fooditem = @restaurant.fooditems.find(params[:id])
    @fooditem.destroy
    redirect_to fooditems_path, notice: "fooditems deleted successfully"
  end

  private

  def params_fooditem
    params.require(:fooditem).permit(:name, :description, :price)
  end
end
