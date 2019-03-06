class Item < ApplicationRecord
    has_many :orders
    has_one_attached :photo

    def thumbnail_300
        return self.photo.variant(resize: '300x300')
    end
end
