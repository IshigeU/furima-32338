class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    @orderform = OrderForm.new
    if @item.purchase_history.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
  def create
    @orderform = OrderForm.new(purchase_history_params)
    if @orderform.valid?
      pay_item
      @orderform.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
  def purchase_history_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
