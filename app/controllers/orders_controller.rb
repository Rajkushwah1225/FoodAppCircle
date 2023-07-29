class OrdersController < ApplicationController
  
  #load_and_authorize_resource
  
  def index
    @orders = current_user.orders
  end

  def new
    @cart_items = 
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.total_price = Fooditem.where(id: params[:order][:fooditem_ids]).pluck(:price).sum
    if @order.save
      @order.update(status: 0)
      UserMailer.order_mail(current_user.email).deliver_now
      flash[:success] = "Thank you for your order"
      redirect_to @order
    else
      flash.now[:error] = "some errors occur"
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @status = @order.status
  end

  def confirmed
    @order = Order.find(params[:order_id])
    @order.update(status: :Confirmed)
    flash[:success] = "your order has been Confirmed"
    redirect_to request.referrer
  end

  def rejected
    @order = Order.find(params[:order_id])
    @order.update(status: :Rejected)
    flash[:success] = "your order has been Rejected"
    redirect_to request.referrer
  end

  def cancelled
    @order = Order.find(params[:order_id])
    @order.update(status: :Cancelled)
    flash[:success] = "your order has been cancelled"
    redirect_to request.referrer
  end

  
  private
  def order_params
    params.require(:order).permit(:status , :address, :restaurant_id, fooditem_ids: [])
  end
end

#UserMailer.example(User.new(email: 'bo@samurails.com')).deliver
#@users = User.all
