class OrderPayForm
  include ActiveModel::Model

   attr_accessor :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token, :city, :addresses
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

    validates :phone_number, format: { with: /\A\d{11}\z/ }
    
    with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} do
      validates :postal_code
    end
  end
end