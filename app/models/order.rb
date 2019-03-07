class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :cart_items, through: :cart

  after_create :send_order_email_to_user, :send_order_email_to_admin

  def find_current_user_cart(current_user)
      return Cart.where(user: current_user).last
  end

  def find_cart_items_of_the_cart(cart)
      return CartItem.where(cart_id: cart.id)
  end

  def total_amount_order(cart_items)
      total = 0.00
      cart_items.each do |cart_item|
      total = cart_item.item.price + total
      end
      return total
  end

  def attribute_new_cart_to_user(current_user)
    Cart.new(user_id: current_user.id)
  end

  # Sending an email to a user for his order
  def send_order_email_to_user
    UserMailer.order_email_to_user(self).deliver_now!
  end

  # Sending and email to the admin whenever a user validates a new order
  def send_order_email_to_admin
    AdminMailer.order_email_to_admin(self).deliver_now!
  end


end
