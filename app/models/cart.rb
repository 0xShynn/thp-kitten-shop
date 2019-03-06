class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  before_create :default_values
  
  def already_ordered
    self.is_ordered == true 
  end
  
  private
  
  def default_values
    self.is_ordered ||= false
  end


end
