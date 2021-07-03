class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Oder.create(order_params)
    PayForm.create(pay_form_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:price).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_form_params
    params.permit(:postal_code, :prefecture, :city, :addresses, :building,:phone_number).merge(order_id: @order.id)
  end

end
