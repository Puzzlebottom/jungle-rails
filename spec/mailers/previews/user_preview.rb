# Preview all emails at http://localhost:3000/rails/mailers/user
class UserMailerPreview < ActionMailer::Preview
  def confirmation_email
    @user = User.find(1)
    @order = Order.find(1)
    UserMailer.with(user: @user, order: @order).confirmation_email
  end
end
