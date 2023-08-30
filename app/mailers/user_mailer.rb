class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email
    @user = params[:user]
    @order = params[:order]
    mail(to: @order.email, subject: "Order ##{@order.id} confirmation")
  end
end
