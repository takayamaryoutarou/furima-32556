class Purchase < ApplicationRecord
  has_one_attached :item

  with_options presence: true do
    validates :item
    validates :user
  end
end
