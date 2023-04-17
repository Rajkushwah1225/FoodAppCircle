class CartsController < ApplicationController
  
  def carts_cuisines
    @cart_cuisine = current_user.cart
    @cuisine = Cuisine.find(@cart_cuisine.cuisine_id)
  end


  def create
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @cuisine = Cuisine.find_by(id: params[:cuisine_id])
    @cart = Cart.new(cuisine_id: @cuisine.id)
    @cart.user_id = current_user.id
  if @cart.save
    redirect_to request.referrer
  else
    redirect_to request.referrer
  end
 end
end

