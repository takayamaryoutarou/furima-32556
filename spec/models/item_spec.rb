require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
   context '商品登録がうまくいかない時' do
      it 'titleが空では登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'product_descriptionが空では登録できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it 'state_idが空では登録できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "State is not a number"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture is not a number"
      end
      it 'delivery_date_idが空では登録できない' do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date is not a number"
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge is not a number"
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格の範囲が300以下であれば登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it '価格の範囲が9999999以上であれば登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it '価格は半角数字以外では登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
    end
  end
end