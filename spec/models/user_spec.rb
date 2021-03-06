require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかない時' do
      it 'nameが空では登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）を使用しないと登録できない' do
        @user.first_name = 'Tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Kanji / Hiragana / Katakana input characters.'
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）を使用しないと登録できない' do
        @user.last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Kanji / Hiragana / Katakana input characters.'
      end
      it 'first_name_kanaは全角（カタカナ）を使用しないと登録できない' do
        @user.first_name_kana = 'Tanaka亜'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid. Katakana input characters.'
      end
      it 'last_name_kanaは全角（カタカナ）を使用しないと登録できない' do
        @user.last_name_kana = 'tarou亜'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid. Katakana input characters.'
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'A234t'
        @user.password_confirmation = 'A234t'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは登録できないこと' do
        @user.password = 'ttttttttttt'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Encrypted password is invalid. Please enter alphanumeric characters.')
      end
      it 'passwordが半角数字のみでは登録できないこと' do
        @user.password = '555555'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Encrypted password is invalid. Please enter alphanumeric characters.')
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = 'ああああああああ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Encrypted password is invalid. Please enter alphanumeric characters.')
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it '@が含まれないと登録できない' do
        @user.email = 'tttttt12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
    end

    context '新規登録がうまくいく時' do
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '12345t'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
  end
end
