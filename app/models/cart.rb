class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_items
  before_create :default_values
  
  private

  def default_values
    self.is_ordered ||= false
  end

end
