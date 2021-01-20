class PurchaseProcedure

  include ActiveModel::Model
  attr_accessor :postal_code,:city,:block,:building_name,:prefecture_id,:phone_number,:purchase,:item_id,:user_id,:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: 'Zip code requires hyphen' }
    validates :city
    validates :block
    validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: 'is invalid for more than 10 digits' }
    validates :item_id
    validates :user_id
    validates :token

   
  end

  validates :phone_number,  numericality: { message: 'are invalid except numbers' }

     with_options numericality: { other_than: 0 } do
      validates :prefecture_id
     end
  def save
      
      # 住所の情報を保存
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
     
      DeliveryDestination.create(postal_code: postal_code, city: city, block: block, building_name: building_name, prefecture_id: prefecture_id, phone_number: phone_number, purchase_id: purchase.id)
      
  end

end