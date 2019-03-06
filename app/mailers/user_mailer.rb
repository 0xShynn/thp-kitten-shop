class UserMailer < ApplicationMailer
 
  def welcome_email_to_user(user)

    @user = user

    mail(
      from: "a.nhek@icloud.com",
      to: user.email, 
      subject: 'Bienvenue chez nous ! - Kitten Shop',
      delivery_method_options: { version: 'v3.1' }
    )
  end

  def email_order_to_user(order)
    @order = order
    
    mail(
      from: "a.nhek@icloud.com",
      to: order.user.email, 
      subject: "Merci d'avoir passé une commande sur Kitten Shop",
      delivery_method_options: { version: 'v3.1' }
    )    
  end
end