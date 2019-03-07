class Item < ApplicationRecord
    has_many :orders
    has_one_attached :photo

  def thumbnail_300
    if self.photo == true
      return self.photo.variant(resize: '300x300')
    end
  end
end
