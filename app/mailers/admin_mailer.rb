class AdminMailer < ApplicationMailer

  def email_new_user(user)
    
    @admin = User.find(1)

    mail(
      from: "a.nhek@icloud.com",
      to: @admin.email,
      subject: "Au top ! Un nouvel utilisateur s'est inscrit :)",
      delivery_method_options: { version: 'v3.1' }
    )    
  end

  def email_order_to_admin(user)

    @admin = User.find(1)

    mail(
      from: "a.nhek@icloud.com",
      to: @admin.email,
      subject: 'Une nouvelle commande a été passée, super !',
      delivery_method_options: { version: 'v3.1' }
    )
  end
end
