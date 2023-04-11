class RestaurantController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end
   
  
   
  def new
   @restaurant = Restaurant.new
  end

  def create
  @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
   redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

def update
end

def destroy
  @restaurant = Restaurant.find(params:[id])
  @restaurant.destroy
  redirect_to root_path
end

# def action
#   @restaurant = Restaurant.find(params[:id])
# end
def show
end

private

def restaurant_params
 params.require(:restaurant).permit( :name, :description , :address)
 end
end