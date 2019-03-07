class Item < ApplicationRecord
    has_many :orders
    has_one_attached :photo

  def thumbnail_300
    if self.photo == true
      return self.photo.variant(resize: '300x300')
    end
  end

  def thumbnail_200
    return self.photo.variant(resize: '200x200')
  end

  scope :featured, -> { where(featured: true) }

  def self.latest_article
    order('published_at desc').first
  end

end
