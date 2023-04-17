class OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @cart = Cart.find(params[:cart])
  end

  def create
    @order = Order.new(order_params)
    @user = current_user
    if @order.save
      UserMailer.order_mail(@user.email).deliver_now
      flash[:success] = "Thank you for your order"
      redirect_to root_path
    else
      flash.now[:error] = "Your order form had some errors"
      render :new
    end
  end
  
  def show
    @order = Order.find(params[:id])
  end


  def index
    UserMailer.example(User.new(email: 'bo@samurails.com')).deliver
    @users = User.all
  end

  private

  def order_params
    params.require(:order).permit(:cart_id , :user_id , :address , :city ,:state ,:total_price)
  end
end
