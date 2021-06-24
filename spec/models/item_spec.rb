require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品ページへの遷移' do

    context 'ユーザーがログインしている時' do
      it '出品ページへ遷移できる' do
      end
    end

    context 'ユーザーがログインしていない時' do
      it 'ログイン画面へ遷移する' do
      end
    end

  end

  describe '出品の保存' do

    context '出品が投稿できる場合' do
      it '画像とテキストがあれば投稿できる' do
      end
      it 'テキストがあれば投稿できる' do
      end
    end

    context 'ツイートが投稿できない場合' do
      it 'nameがid:1では投稿できない' do
      end 

      it 'infoがid:1では投稿できない' do
      end

      it 'category_idがid:1では投稿できない' do
      end

      it 'sales_status_idがid:1では投稿できない' do
      end

      it 'priceが空では投稿できない' do
      end

      it 'priceが300以下では投稿できない' do
      end

      it 'priceが9999999以上では投稿できない' do
      end

      it 'priceが大文字では投稿できない' do
      end

      it 'shipping_fee_status_idがid:1では投稿できない' do
      end

      it 'prefecture_idがid:1では投稿できない' do
      end

      it 'scheduled_delivery_idがid:1では投稿できない' do
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
      end





    end
  end



end
