class CartitemsController < ApplicationController
  def new
  end

  def show
  end

  def update
    #byebug
    if param[:context] == "add"
      @cartitem.update(quantity: @cartitem.quantity + 1)
    else param[:context] == "delete"
      quantity = @cartitem.quantity - 1
      @cartitem.update(quantity: quantity.zero? ? 0 : quantity)     end
  end

  def edit
  end

  def create
    @cartitem = Cartitem.find_or_initialize_by(cart: current_user.cart, fooditem_id: params[:fooditem_id])
    @cartitem.quantity = @cartitem.quantity.to_i + 1
    if @cartitem.save
      redirect_to request.referrer
    else
      redirect_to request.referrer 
    end
  end

  def destroy
    @cartitem = Cartitem.find_by(fooditem_id: params[:fooditem_id])
    @cartitem.destroy
   redirect_to root_path
   end

  def increase_quantity
    @cartitem = Cartitem.find(params[:cartitem_id])
  end

  def decrease_quantity
    @cartitem = Cartitem.find(params[:cartitem_id])
  end

  def remove
  end
end
