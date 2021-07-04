require 'rails_helper'

RSpec.describe OrderPayForm, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_pay_form = FactoryBot.build(:order_pay_form,user_id: @user.id , item_id: @item.id)
      sleep 0.1
    end
    context '商品が購入できる場合' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_pay_form).to be_valid
      end

      it '建物は空でも登録できること'do
        @order_pay_form.building = ' '
        expect(@order_pay_form).to be_valid
      end

      it 'phone-numberが10桁でも登録できること'do
      @order_pay_form.phone_number = '0123456789'
      expect(@order_pay_form).to be_valid
    end

  end
  
  context '商品が購入できない場合' do

    it "tokenが空では登録できないこと" do
      @order_pay_form.token = nil
      @order_pay_form.valid?
      expect(@order_pay_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空である' do
      @order_pay_form.user_id = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空である' do
        @order_pay_form.item_id = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空である' do
        @order_pay_form.postal_code = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが含まれていない' do
        @order_pay_form.postal_code = '1111111 '
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeの文字数が足りない' do
        @order_pay_form.postal_code = '11-111'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeの数字が大文字である' do
        @order_pay_form.postal_code = '１２３-１２３４'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeのハイフンが大文字である' do
        @order_pay_form.postal_code = '123ー1234'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idがid = 1である' do
        @order_pay_form.prefecture = 1
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空である' do
        @order_pay_form.city = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空である' do
        @order_pay_form.addresses = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空である' do
        @order_pay_form.phone_number = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberの文字数が9桁である' do
        @order_pay_form.phone_number = '012345678'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include( "Phone number is invalid")
      end

      it 'phone_numberの文字数が12桁である' do
        @order_pay_form.phone_number = '012345678901'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include( "Phone number is invalid")
      end

      it 'phone_numberにハイフンが入っている' do
        @order_pay_form.phone_number = '012-3456-7890'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include( "Phone number is invalid")
      end


      it 'phone_numberの数字が全角である' do
        @order_pay_form.phone_number = '１２３４５６７８９０１'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include( "Phone number is invalid")
      end

      it "phone_numberは英数混合では登録できないこと" do
      @order_pay_form.phone_number = '1a1a1a1a1a1'
      @order_pay_form.valid?
      expect(@order_pay_form.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
end
