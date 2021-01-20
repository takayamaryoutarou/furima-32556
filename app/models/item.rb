class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :delivery_date
  belongs_to :prefecture
  belongs_to :state
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :title
    validates :price
    validates :product_description
    validates :image
  end

  validates_inclusion_of :price, in: 300..9_999_999

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. half-width number input characters.' }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :delivery_charge_id
    validates :delivery_date_id
    validates :state_id
  end
end
