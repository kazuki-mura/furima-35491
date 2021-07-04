class OrderPayForm
  include ActiveModel::Model

   attr_accessor :token, :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token, :city, :addresses, :user_id, :item_id
    validates :prefecture, numericality: {other_than: 1}

    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    
    with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} do
      validates :postal_code
    end
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    PayForm.create(postal_code: postal_code, prefecture_id: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end