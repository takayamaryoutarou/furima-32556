require 'rails_helper'

RSpec.describe PurchaseProcedure, type: :model do
  before do
    @purchase_procedure = FactoryBot.build(:purchase_procedure)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいかない時' do
      it 'postal_codeが空では登録できない' do
        @purchase_procedure.postal_code = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'cityが空では登録できない' do
        @purchase_procedure.city = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "City can't be blank"
      end
      it 'blockが空では登録できない' do
        @purchase_procedure.block = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Block can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @purchase_procedure.phone_number = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが12桁では登録できない' do
        @purchase_procedure.phone_number = '090000000000'
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Phone number is invalid for more than 10 digits"
      end
      it 'phone_numberが数字のみでないと登録できない' do
        @purchase_procedure.phone_number = '0900a00000'
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Phone number are invalid except numbers"
      end
      it 'item_idが空では登録できない' do
        @purchase_procedure.item_id = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Item can't be blank"
      end
      it 'user_idが空では登録できない' do
        @purchase_procedure.user_id = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "User can't be blank"
      end
      it 'tokenが空では登録できない' do
        @purchase_procedure.token = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Token can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @purchase_procedure.prefecture_id = nil
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include "Prefecture is not a number"
      end
      it 'postal_codeがハイフンがなければ登録できないこと' do
        @purchase_procedure.postal_code = 123123
        @purchase_procedure.valid?
        expect(@purchase_procedure.errors.full_messages).to include 'Postal code Zip code requires hyphen'
      end
   
    end

    context '商品購入がうまく行く時' do
      it 'phone_numberが10桁以内であれば登録できる' do
        @purchase_procedure.phone_number = '09043514667'
        expect(@purchase_procedure).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @purchase_procedure.building_name = nil
        expect(@purchase_procedure).to be_valid
      end
      it '全ての購入情報が正しければ、登録できる' do
        expect(@purchase_procedure).to be_valid
      end
    end
  end
end

