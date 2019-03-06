class AdminMailer < ApplicationMailer

  def new_user_email_to_admin(user)
    
    @admin = User.find(1)
    @user = user

    mail(
      from: "a.nhek@icloud.com",
      to: @admin.email,
      subject: "Au top ! Un nouvel utilisateur s'est inscrit :)",
      delivery_method_options: { version: 'v3.1' }
    )    
  end

  def order_email_to_admin(order)

    @admin = User.find(1)
    @order = order

    mail(
      from: "a.nhek@icloud.com",
      to: @admin.email,
      subject: 'Une nouvelle commande a été passée, super !',
      delivery_method_options: { version: 'v3.1' }
    )
  end
end
