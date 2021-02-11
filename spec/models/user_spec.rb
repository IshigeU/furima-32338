require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、sei、mei、kana_sei、kana_mei、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '000aaa'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数混合でないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは英字のみは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは数字のみは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'AAAAAA'
        @user.password_confirmation = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'seiが空では登録できない' do
        @user.sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei can't be blank")
      end
      it 'seiが全角漢字、ひらがな、カタカナ以外は登録できない' do
        @user.sei = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei is invalid")
      end
      it 'meiが空では登録できない' do
        @user.mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei can't be blank")
      end
      it 'meiが全角漢字、ひらがな、カタカナ以外は登録できない' do
        @user.mei = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei is invalid")
      end
      it 'kana_seiが空では登録できない' do
        @user.kana_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana sei can't be blank")
      end
      it 'kana_seiがフリガナ以外は登録できない' do
        @user.kana_sei = 'aaa仮名111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana sei is invalid")
      end
      it 'kana_meiが空では登録できない' do
        @user.kana_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana mei can't be blank")
      end
      it 'kana_meiがフリガナ以外は登録できない' do
        @user.kana_mei = 'aaa仮名111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana mei is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'password5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end
