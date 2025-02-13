class CartsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy]
  before_action :set_food_item, only: :create
  before_action :set_cart_item, except: :destroy

  def create 
    CartItem.create(cart: current_user.cart, food_item: food_item)
  end

  def show
    @cart_items = current_user.cart.cartitems
    @restaurant_id = @cart_items.first.fooditem.restaurant_id
  end
end

# def update
#   @cart_item.update_quantity(params[:action].to_sym)
# end

# def destroy
#   @cart_item.destroy
# end

# private

# def set_food_item
#   @food_item = FoodItem.find(params[:food_item_id])
# end

# def set_cart_item
#   @cart_item = CartItem.find(id)
# end
#   def confirmed
#    @order = Order.find(params[:order_id])
#    @order.update(status: :Confirmed)
#    flash[:success] = "your order has been Confirmed"
#    redirect_to request.referrer
#   end

#   def update_quantity action
#    if action == :increase
#      self.update(qty: :qty)
#    else action == :decrease
#    end
#  end

#  def cancel_item
#   @cart = Cart.find(params[:cart_id])
#   @cart.update(status: :Cancelled)
#   flash[:success] = "cancelled"
#   redirect_to request.referrer
#  end
# end
