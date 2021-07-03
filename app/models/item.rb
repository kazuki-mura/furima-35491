class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  with_options presence: true do
    validates :image
    validates :name
    validates :info 
    validates  :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id 
      validates :prefecture_id
      validates :scheduled_delivery_id
      validates :shipping_fee_status_id
    end
  end

  belongs_to :user
  has_one_attached :image
  has_one :order

end
