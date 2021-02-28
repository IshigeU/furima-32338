require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @orderform = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end
    context '購入できる場合' do
      it '全部もれなく入力されていれば購入できる' do
        expect(@orderform).to be_valid
      end
      it '建物名が空でも購入できる' do
        @orderform.building_name = ''
        expect(@orderform).to be_valid
      end
    end

    context '購入できない場合' do
      it 'city(市区町村)が空だと購入できない' do
        @orderform.city = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("City can't be blank")
      end
      it 'address(番地)が空だと購入できない' do
        @orderform.address = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Address can't be blank")
      end
      it 'Tokenが空だと購入できない' do
        @orderform.token = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefecture(都道府県)が「--」(id:1)だと購入できない' do
        @orderform.prefecture_id = 1
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'post_code(郵便番号)が空だと購入できない' do
        @orderform.post_code = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_code(郵便番号)に「-」がないと購入できない' do
        @orderform.post_code = '1111111'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post code is invalid")
      end
      it 'phone_number(電話番号)が空だと購入できない' do
        @orderform.phone_number = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number(電話番号)は11桁以下でないと購入できない' do
        @orderform.phone_number = '1234567891011'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number(電話番号)には「-」は不要である' do
        @orderform.phone_number = '090-1111-1111'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと登録できない' do
        @orderform.user_id = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @orderform.item_id = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end