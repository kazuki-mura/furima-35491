require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品の出品' do
    
    context '出品が投稿できる場合' do
      it '入力項目が正しければ出品ができる' do
        expect(@item).to be_valid
      end
     
    end
    
    context '出品ができない場合' do
      
      it 'imageが空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end 

      it 'nameが空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end 

      it 'infoが空では投稿できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idがid:1では投稿できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'sales_status_idがid:1では投稿できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end

      it 'priceが空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300以下では投稿できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが9999999以上では投稿できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが全角数字では投稿できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが数字では投稿できない' do
        @item.price = '二千九百'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'shipping_fee_status_idがid:1では投稿できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end

      it 'prefecture_idがid:1では投稿できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'scheduled_delivery_idがid:1では投稿できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end





    end
  end



end
