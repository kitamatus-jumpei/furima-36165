require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'titleとexplanation,category_id,condition_id,charge_id,area_id,days_id,price,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが初期値では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが初期値では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'charge_idが空では登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'charge_idが初期値では登録できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが初期値では登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'days_idが空では登録できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'days_idが初期値では登録できない' do
        @item.days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300~¥9999999の範囲で入力してください')
        # エラー文を二つにしようとしたが、バリデーションで紐づけている方を優先する
      end
      it 'priceがアルファベットでは登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300~¥9999999の範囲で入力してください')
      end
      it 'priceがひらがなでは登録できない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300~¥9999999の範囲で入力してください')
      end
      it 'priceがカタカナでは登録できない' do
        @item.price = 'ア'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300~¥9999999の範囲で入力してください')
      end
      it 'priceが漢字では登録できない' do
        @item.price = '木'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300~¥9999999の範囲で入力してください')
      end
      it 'priceが３００未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300~¥9999999の範囲で入力してください')
      end
      it 'priceが９９９９９９９以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price ¥300~¥9999999の範囲で入力してください')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
