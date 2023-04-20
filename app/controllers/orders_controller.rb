class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @cartitem = Cartitem.find_by(fooditem_id: params[:fooditem_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @user = current_user
    if @order.save
      @order.update(status: 0)
      UserMailer.order_mail(@user.email).deliver_now
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
    params.require(:order).permit(:cart_id, :user_id, :address, :city, :state, :total_price)
  end
end

#UserMailer.example(User.new(email: 'bo@samurails.com')).deliver
#@users = User.all
