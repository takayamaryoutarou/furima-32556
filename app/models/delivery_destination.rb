class DeliveryDestination < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block
    validates :building_name
    validates :phone_number
    validates :purchase

  end

  with_options numericality: { other_than: 0 } do
    validates :prefecture_id
  end
end
