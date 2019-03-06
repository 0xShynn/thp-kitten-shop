class UserMailer < ApplicationMailer
 
  def welcome_email(user)

    @user = user

    mail(
      from: "a.nhek@icloud.com",
      to: user.email, 
      subject: 'Bienvenue chez nous ! - Kitten Shop',
      delivery_method_options: { version: 'v3.1' }
    )
  end

  def notif_order_email(order)
    @order = order
    

    mail(
      from: "a.nhek@icloud.com",
      to: order.user.email, 
      subject: "Merci d'avoir passé une commande sur Kitten Shop",
      delivery_method_options: { version: 'v3.1' }
    )    
  end
end