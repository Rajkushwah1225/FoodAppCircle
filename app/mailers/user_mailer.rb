class UserMailer < ApplicationMailer
  def order_mail(user)
   @user = user
   mail(to: @email, subject: 'Order has Successfully recieved')
  end
end