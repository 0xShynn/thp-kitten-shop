class Item < ApplicationRecord
    has_many :orders
    has_one_attached :photo

  # Customized slugs
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      [:name],
      [:name, :id],
    ]
  end  

  def thumbnail_300
    if self.photo == true
      return self.photo.variant(resize: '300x300')
    end
  end
end
