require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品が出品できる場合' do
      it '全部もれなく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @item.items_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items category can't be blank")
      end
      it '商品の状態が未選択だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が未選択だと出品できない' do
        @item.delivary_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary cost can't be blank")
      end
      it '発送元の地域が未選択だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が未選択だと出品できない' do
        @item.delivary_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary day can't be blank")
      end
      it '販売価格が未選択だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円未満だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が全角数字だと出品できない' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end