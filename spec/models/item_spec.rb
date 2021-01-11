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
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end
      it 'state_idが空では登録できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'State must be other than 0'
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
      end
      it 'delivery_date_idが空では登録できない' do
        @item.delivery_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery date must be other than 0'
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery charge must be other than 0'
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格の範囲が300以下であれば登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '価格の範囲が9999999以上であれば登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '価格は半角数字以外では登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '画像がないと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
    context '商品登録がうまく行く時' do
      it '価格の範囲が300以上、9999999以下、半角数字であれば登録できる' do
        @item.price = 301
        expect(@item).to be_valid
      end
      it '全ての商品情報が正しければ、登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
