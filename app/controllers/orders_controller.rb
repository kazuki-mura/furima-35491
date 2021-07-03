class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_pay_form = OrderPayForm.new
  end

  def create
    @order_pay_form = OrderPayForm.new(order_params)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_pay_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  # def pay_form_params
  #   params.permit(:postal_code, :prefecture_id, :city, :addresses, :building,:phone_number).merge(order_id: @order.id)
  # end

end
