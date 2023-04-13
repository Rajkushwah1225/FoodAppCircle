class FooditemsController < ApplicationController
  
  def index
    @fooditems = Fooditem.all
  end

  def new
    @fooditem = Fooditem.new
  end

  def create
    @cuisine = Cuisine.new(fooditem_params)
    @fooditem = Fooditem.new(fooditem_params)
    if @fooditem.save
       redirect_to fooditems_path , notice:"fooditem successfully created"
    else
       render :new 
    end
  end
  
  def update
    @fooditem = Fooditem.find(params[:id])
    if @fooditem.save
      redirect_to fooditems_path 
    else
      render :new 
    end
  end

  def edit
    @fooditem = Fooditem.find(params[:id])
  end

  def destroy
    @fooditem = Fooditem.find(params[:id])
    @fooditem.destroy
    redirect_to fooditems_path , alert: "Item Deleted"
  end

  private

  def fooditem_params
    params.require(:fooditem).permit(:name ,:description , :price)
  end
end