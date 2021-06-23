class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
  
  belongs_to :user
  has_one_attached :image

end
