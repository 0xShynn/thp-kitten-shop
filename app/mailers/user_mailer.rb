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
end