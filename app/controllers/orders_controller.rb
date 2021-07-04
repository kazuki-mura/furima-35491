class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root

  def index
    @order_pay_form = OrderPayForm.new
  end

  def create
    @order_pay_form = OrderPayForm.new(order_params)
    if @order_pay_form.valid?
      pay_item
      @order_pay_form.save
      return redirect_to root_path
  else
    render 'index'
  end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_pay_form).permit(:postal_code, :prefecture, :city, :addresses, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
    end

    def move_to_root
      redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
    end
end
