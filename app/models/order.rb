class Order < ApplicationRecord
    belongs_to :user
    belongs_to :cart
    has_many :cart_items, through: :cart

    def find_current_user_cart(current_user)
        return Cart.find_by(user: current_user)
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
end
